---
layout: post
title: Running R Script in Batch Mode on Rhino
date: 2018-09-07
tags: technical_note
author: Chao-Jen Wong
---

Running R in batch mode might be helpful when you want to send your R script as batch script to slurm. For example, you might want to to do `sbatch my_code.R` or `sbatch -M beagle --exclusive -n1 my_code.R`. Unlike 
using `Rscript my_code.R` on the commend line, you need two extra steps: (1) start first line of your script with a shebang 
indicating the path of _Rscript_: `#!/app/easybuild/software/R/3.5.1-foss-2016b-fh1/bin/Rscript`, and (2) change the mode of the 
script as an executable: `chmod +x my_code.R`. With these two steps, you can do `sbatch my_code.R`.
    
## Running with shebang
Suppose `my_code.R` look like the following

```
#!/app/easybuild/software/R/3.5.1-foss-2016b-fh1/bin/Rscript
print("hello world!")
```
Here I am using `R/3.5.1-foss-2016b-fh1` on Rhino. You can check whichever R version is available on _Rhino_ (`module avail`). 

On commend line, you can run `my_code.R` like the following:
```
./my_code.R
```

Or run `my_code.R` as an executable by changing its mode:
```
chmod g+x my_code.R
my_code.R
```

I use `g+x` so that my lab members can also use it as an executable. 

## Sending batch script to slurm
If your R scripts means to analyze rather large dataset, you can conveniently send your R script as batch script to slurm. 

```
sbatch my_code.R
```
or beagle
```
sbatch -M beagle my_code.R
```

