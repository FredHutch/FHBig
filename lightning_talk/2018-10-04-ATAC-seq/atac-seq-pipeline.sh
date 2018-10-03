#!/bin/bash
#./atac-seq-pipeline.sh
#SBATCH --exclusive ./atac-seq-pipeline.sh --mail-type=ALL --mail-user=cwon2@fhcrc.org -A tapscott_s

fastqDir=$1
sampleName=$2
trimmedOutDir=$3
bowtie2OutDir=$4

mkdir -p $bowtie2OutDir
mkdir -p $trimmedOutDir

hg38_genomeBuild=/shared/biodata/ngs/Reference/iGenomes/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome

ml bowtie2/2.2.5
ml cutadapt/1.1
ml picard/2.7.1-Java-1.8.0_92
ml samtools/1.0

# 1. cat all fastq.gz files
cd $fastqDir

fq1=$trimmedOutDir/$sampleName\_R1.fastq
fq2=$trimmedOutDir/$sampleName\_R2.fastq

zcat $(ls *_R1_*.fastq.gz) > $fq1
zcat $(ls *_R2_*.fastq.gz) > $fq2

# 2. trim 5' transposes adapters (--cores=4)
cd $trimmedOutDir
trim1=$trimmedOutDir/$sampleName\_R1\_trimmed.fastq
trim2=$trimmedOutDir/$sampleName\_R2\_trimmed.fastq
cutadapt -g TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG -O 5 -e 0.2 $fq1  > $trim1 \
	 2> $sampleName\_R1\_cutadapt\_report.txt
cutadapt -g GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG -O 5 -e 0.2 $fq2 > $trim2 \
	 2> $sampleName\_R2\_cutadapt\_report.txt

gzip $trim1
gzip $trim2

# cleaning
rm $fq1
rm $fq2

# 3. align to hg38
echo "bowtie2 alignment"
cd $bowtie2OutDir
bowtie2 --very-sensitive -p 4 --seed 123 -k 16 -I 20 -X 1000  -x $hg38_genomeBuild \
     -1 $trim1.gz -2 $trim2.gz \
    | samtools view -Sb - > $sampleName.bam

# sort
samtools sort -@ 4 $sampleName.bam $sampleName.bam.sorted
mv $sampleName.bam.sorted.bam $sampleName.bam

# 4. PCR duplicates
echo "remove PCR duplicates"
java -jar ${EBROOTPICARD}/build/libs/picard.jar MarkDuplicates  \
     I=$sampleName.bam O=$sampleName\_filter.bam  \
     M=$sampleName\_dup\_matrics.txt REMOVE_DUPLICATES=true \
     ASSUME_SORTED=true \
     TMP_DIR=$HOME/tmp

mv $sampleName\_filer.bam $sampleName.bam

# remove chrM: use Bioconductor?
echo "remove chrM"
samtools view -h $sampleName.bam | awk '{if($3 != "chrM"){print $0}}' \
    | samtools view -Sb - > $sampleName\_filter.bam
mv $sampleName\_filter.bam $sampleName.bam

# index
samtools index $sampleName.bam
touch $sampleName.bowtie2Done.txt
