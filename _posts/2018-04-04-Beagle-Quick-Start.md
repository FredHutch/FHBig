---
layout: post
title: Beagle Quick Start
date: 2018-04-04
tags: technical_note
---

Lately I have experienced traffic jam on our gizmo cluster and cannot acquired largenode without waiting for a couple days. So it is time for me to migrate to beagle - a bridge to AWS cloud computing. First of all, we can find the beagle cluster user guide [here](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/beagle%20Cluster%20User%20Guide.aspx). Below is a quick start if you want to skip reading the SciComp's wiki page.

## Basic use
To summit a job, use _sbatch_ in a similar manner as on gizmo and add `-M beagle` to the commend:
```
sbatch -M beagle -n1 my_job.sh
```

## Managing jobs
Similarly, use _squeue_, _sacct_ and _scancel_ and add `-M beagle` to the commend. Note that _srun_ and _salloc_ does not work on beagle.
```
squeue -M beagle -u my_username
```

## Partition
There are three classes available: F, G  and H, each of which has 16GB, 60GB and 244GB, respectively. The default partition is the F class (campus).

| Class | CPUs | RAM | Partition|
|:---|:---|:---|:---|
|F  | 4 | 16GB | campus, c4.2xlarge |
|G | 18 | 60 GB | largenode, c4.8large |
|H |16 | 244GB | largenode, r4.8xlarge |

### Example
- Partition on G class with one task and have the whole RAM:
```
sbatch -M beagle --exclusive -n1 -p largenode my_job.sh
```
With `--exclusive` you get the whole computer with 18 cores and 60 GB RAM (if partition on G class) and not share with others.

- Partition on G class with one task and a few cores:
```
sbatch -M beagle -n1 -c4 -p largenode my_job.sh
```
Without using `--exclusive`, you will share memory with other submitted jobs.

Please edit this page is you have more useful information.

By Chao-Jen Wong
