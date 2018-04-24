---
layout: post
title: Beagle Quick Start
date: 2018-04-04
tags: technical_note
author: Chao-Jen Wong
---

Lately I have experienced traffic jam on our gizmo cluster and cannot acquired largenode without waiting for a couple days. So it is time for me to migrate to beagle - a bridge to AWS cloud computing. The complete beagle cluster user guide is [here](https://teams.fhcrc.org/sites/citwiki/SciComp/Pages/beagle%20Cluster%20User%20Guide.aspx) on SciComp's wiki. Below is a just quick start. (click on the title to continue.)

## About
From SciComp's wiki:


> Beagle can be seen as an extension of gizmo into AWS cloud infrastructure.  For this, we intended to make transitioning as easy as possible, so we've retained the familiar Slurm workload manager as well as extending on-campus storage to this system.  Thus, your files- shared fast directories, your home directory, the shared app tools directory- area all available  at the same paths as with gizmo compute nodes.

>Thus, all that is really necessary are small changes to the Slurm commands to enable your jobs to run on beagle nodes.  

> However: it needs to be noted that as access to data is much slower than your access here on campus.  On IO intensive workloads you may see up to a 3x slowdown on overall time to complete a job.


## Basic use
To summit a job, use _sbatch_ in a similar manner as on gizmo and add `-M beagle` to the commend:
```
sbatch -M beagle -n1 my_job.sh
```
This way you are partitioning one F class note (16GB RAM) and will share memory with other jobs.

## Managing jobs
Similarly, use _squeue_, _sacct_ and _scancel_ and add `-M beagle` to the commend. Note that _srun_ and _salloc_ does not work on beagle.
```
squeue -M beagle -u my_username
```

## Partition
There are three classes available: F, G  and H, each of which has 16GB, 60GB and 244GB, respectively. The default partition is the F class (campus).

| Class |CPUs | RAM | Partition|
|:---|:---|:---|:---|
|F  | 4 | 16GB | campus, c4.2xlarge |
|G | 18 | 60 GB | largenode, c4.8large |
|H | 16 | 244GB | largenode, r4.8xlarge |

There no limit to the number of nodes for each classes. If load is heavy, SciComp will acquire more nodes.

### Examples
- Partition on G class with one task and have the whole RAM:
```
sbatch -M beagle --exclusive -n1 -p largenode my_job.sh
```
With `--exclusive` you get the whole computer with 18 cores and 60 GB RAM (if partitioning on G class) and will not share with others.

- Partition on G class with one task and a few cores:
```
sbatch -M beagle -n1 -c4 -p largenode my_job.sh
```
Without using `--exclusive`, you will share memory with other submitted jobs.

Please edit this page is you have more useful information.

By Chao-Jen Wong
