---
title: "Common misinterpretation of t-statistics"
author: "Chao-Jen Wong"
date: "5/9/2020"
tags: Statistics
---

*NOTE: The targeted audience of this blog post are ones with some
statistical training and of interest in genomic science. This page is
made using R Markdown, and the reproducible R code is embedded.*

It has come to my attention and concern about a few peer-reviewed
scientific papers that might have misinterpreted t-statistics in their
applications. Correlation is not causality. Unfortunately, using
correlation to imply causality is a common mistake, even in
peer-reviewed, prestigious scientific journals. Here is one example that
related to the dynamics of transcriptome regulated by a transcription
factor.

Prelude
-------

A transcription factor is a protein that binds to specific DNA sequences
in such a way that it regulates the switch of its targeted genes. In
genomic science, many studies dedicated to discovering the consequential
functions or mechanisms mediated by transcriptional factors. Here is a
study that has recently crossed my mind.

The *t*-statistics
------------------

Suppose there is a transcription factor, named *TF*, which regulates a
mechanism to suppress and induce the expression of its targeted genes.
Suppose there are two different types of samples involved in the study:
control (*C*) and disease (*D*), in which somewhat *TF* has an
influence on. For simplicity, let’s assume that there is only one
control sample and one disease sample, each of which obtains a
suppressed and induced gene sets of *TF*, and their gene expression
vectors are denoted by *C*<sub>*suppressed*</sub>,
*C*<sub>*induced*</sub>,
*D*<sub>*suppressed*</sub> and
*D*<sub>*induced*</sub>. Assuming the disease sample is
affected by *TF* either by absent or present of *TF*, the study
aimed to understand how the induced and suppressed gene expression are
affected in the disease sample relative to the control sample. This is
how the statistical analysis has been set up:

1.  Compare *C*<sub>*induced*</sub> to
    *C*<sub>*suppressed*</sub> by *t*-test and yield a
    *t*-statistic, denoted *t*<sub>*C*</sub>.
2.  Compare *D*<sub>*induced*</sub> to
    *D*<sub>*suppressed*</sub> by *t*-test and yield a
    *t*-statistic, denoted *t*<sub>*D*</sub>.
3.  Compare *t*<sub>*D*</sub> and *t*<sub>*C*</sub> and exam if the
    difference is significant.

The difference is indeed significant, e.g., *t*<sub>*D*</sub> =  − 5.37
and *t*<sub>*C*</sub> =  − 3.46. The study than concluded that the
decreased *t*<sub>*D*</sub> compared to *t*<sub>*C*</sub> implied a
**global repression** on both suppressed and induced gene sets of *TF*
in the disease sample.

Does the interpretation based on the differences between these two
*t*-statistics make sense? Can *t*<sub>*D*</sub> and *t*<sub>*C*</sub>
alone suggest a causality that the *TF*-targeted genes, both
suppressed and induced, have undergone repression?

Correlation is not causality
----------------------------

The lowered *t*<sub>*D*</sub> relative to *t*<sub>*C*</sub> implies that
the differences between *D*<sub>*inducedd*</sub> and
*D*<sub>*suppresssed*</sub> is more significant than
that of between *C*<sub>*induced*</sub> and
*C*<sub>*suppressed*</sub>; It certainly implies that
*TF*-influenced gene expression is correlated to the disease. Again,
however, correlation is no causality. There could be several casues and
explanations for the lowered *t*<sub>*D*</sub>:

1.  up-regulation in *D*<sub>*suppressed*</sub>
    whereas *D*<sub>*induced*</sub> remains unchanged
    relative to *C*<sub>*induced*</sub>  
2.  down-regulation in *D*<sub>*induced*</sub> whereas
    *D*<sub>*suppressed*</sub> remain unchanged
    relative to *C*<sub>*suppressed*</sub>
3.  global repression (as the study suggested)  
4.  a more complicated mis-regulation in both
    *D*<sub>*suppressed*</sub> and
    *D*<sub>*induced*</sub> and requires additional and
    careful examinations

### Scenario 1

Let me reveal how I calculated the aforementioned
*t*<sub>*D*</sub> =  − 5.37 and *t*<sub>*C*</sub> =  − 3.46 (R code):

``` r
C_induced <- c(1, 1, 1)
C_suppressed <- c(2, 4, 3)
D_induced <- c(1, 2, 1)
D_suppressed <- c(6, 4, 6)
t_C <- t.test(C_induced, C_suppressed)$statistic
t_D <- t.test(D_induced, D_suppressed)$statistic
message(paste0("t_C = ", t_C, " and t_D = ", t_D))
```

    ## t_C = -3.46410161513775 and t_D = -5.3665631459995

By looking at the expression data, *D*<sub>*induced*</sub> and
*C*<sub>*induced*</sub> are comparable. On the other hand,
the mean of *D*<sub>*suppressed*</sub> is elevated
compared to that of *C*<sub>*suppressed*</sub>. Hence,
the decreased *t*<sub>*D*</sub> from *t*<sub>*C*</sub> is caused by the
up-regulation of *D*<sub>*suppressed*</sub>, the suppressed gene set in the *TF*-related disease
sample.

### Scenario 2

``` r
C_induced <- c(1, 1, 1)
C_suppressed <- c(2, 4, 3)
D_induced <- c(-1, 0, 0)
D_suppressed <- c(2.5, 4, 3)
t_C <- t.test(C_induced, C_suppressed)$statistic
t_D <- t.test(D_induced, D_suppressed)$statistic
message(paste0("t_C = ", t_C, " and t_D = ", t_D))
```

    ## t_C = -3.46410161513775 and t_D = -6.33173823613304

In this scenario, *t*<sub>*D*</sub> is significantly lower than
*t*<sub>*C*</sub>. The reason is that while the means of
*C*<sub>*suppressed*</sub> and
*D*<sub>*suppressed*</sub> remain compatible, the mean
of *D*<sub>*induced*</sub> is lower than that of
*C*<sub>*induced*</sub>. So, by looking at the gene
expression, the cause of the lowered *t*<sub>*D*</sub> is the
down-regulation in *D*<sub>*induced*</sub> relative to
*C*<sub>*induced*</sub>.

A tangential opinion
--------------------

We can make many scenarios to create significantly lower
*t*<sub>*D*</sub> than *t*<sub>*C*</sub>. But my point is that, due to
the way this specific *t*-statistics is constructed, the cause of the
stochastic expression changes between the control and disease samples
must relay to the gene expression matrix itself. More sophisticated
examinations must be done to claim a causality for the changes.
