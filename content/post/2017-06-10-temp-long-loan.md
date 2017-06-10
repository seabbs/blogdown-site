---
title: The temptation of a long loan; Risk and rewards of term length
author: "Sam Abbott"
date: "2017-03-08"
slug: temp-long-loan
categories: []
tags: ["rstats", "p2p", "data-analysis"]
---


As a quick update to last weeks post this week we will be using the estimates of bad debt from last week to assess the true risk/rewards of loans at various lengths from the funding circle (FC) loan book. I realised recently that when picking loans my default criteria tends towards picking loans with the lowest percieved risk (i.e lowest risk band) with the highest interest rates possible. This strategy has some interesting consequences in that it preferentially selects long term loans that tend to have higher rates. 

FC surfaces the average bad debt rate by risk band and not by the term of the loan. Whilst this is a simplifying assumption that makes the investing process easier to understand, for it to be true short term loans must be inherantly riskier than long term loans, or the risk of default must be decoupled from time. Both of these assumptions seem unlikely to me,  and in a later past we will be looking further at the lifecourse of loans, but for this week we will simply be using my function for estimating for bad debt individually for each term length. As discussed last time we estimate the percentage of bad debt by comparing the proportion of bad debt, with total debt, accounting for loan size, the principal remaining, and the interest paid on the loan. This approach also has the same caveats as last time in that it does not account for future recoveries by funding circle, and so becomes increasingly inaccurate for more recent loans. 







We first identify the possible loan terms available to borrowers in the FC ecosystem, and the number in each category. We see that by far the most common loans terms are those, as might be expected, that are an integer number of years. For clarity we restrict ourselves to looking at these most common loans (6, 12, 24, 48, 36, and 60 months), stratifying by risk band.


Table: Number of loans by loan length across the funding circle loan book

| Term  | Number of loans  |
| ----- | ---------------- |
|   60  |           12916  |
|  36   |           7199   |
|   48  |            2435  |
|  24   |           1959   |
|   12  |            1578  |
|    6  |             244  |
|   18  |             231  |
|   15  |              70  |
|   14  |              60  |
|   11  |              55  |
|    8  |              51  |
|   16  |              48  |
|    9  |              45  |
|   13  |              43  |
|   17  |              42  |
|   10  |              37  |
|   20  |              22  |
|    7  |              21  |
|   19  |              10  |
|   21  |               8  |
|    3  |               6  |
|    4  |               6  |
|    5  |               6  |
|   22  |               6  |
|    2  |               1  |
|   23  |               1  |
|   29  |               1  |
|   35  |               1  |



![Estimated bad debt rate, accounting for repayments and the principal remaining, for the 6 most common term lengths straitifed by risk band](/post/2017-06-10-temp-long-loan/figure-html/est_bad_rate_risk-1.png)

We see that the assumption that short term loans are higher risk is only true for loans of 6 months, and for E loans of 12 months, which have a much greater risk of bad debt than all other loans. However these loans are relatively rare so this may be an artifact of low statistical power. For all other loan lengths we see that the risk of bad debt increases, with time with loans that are 36 months and over accounting for the majority of the bad debt in all risk categories. As I have not accounted for the maturity of loans, this apparent trend may be driven by the differing ages of loans in different years. Therefore we repeat the above but now stratify further by year, dropping loans with 6 month terms for clarity. Whilst this does add some variation the overall trend appears to hold with longer term loans having significantly higher proportions of bad debt, this is particularly true of E loans, where 60 month loans have much higher bad debt rates than those with shorter terms.  

An obvious point to note is that FC adjusts interest rates by term length, so that longer term loans have higher rates, this adjustment is obviously to account for the disparity in risk over loan term. In a follow up post I will be using these estimates of bad debt by loan term to evaluate the return on loans of difffernt term lengths to assess whether these adjustments sufficiently account for the increased risk of longer term loans. 


![Estimated bad debt by term length stratified by risk band, for 2011](/post/2017-06-10-temp-long-loan/figure-html/bad_debt_2011-1.png)

![Estimated bad debt by term length stratified by risk band, for 2012](/post/2017-06-10-temp-long-loan/figure-html/bad_debt_2012-1.png)

![Estimated bad debt by term length stratified by risk band, for 2013](/post/2017-06-10-temp-long-loan/figure-html/bad_debt_2013-1.png)

![Estimated bad debt by term length stratified by risk band, for 2014](/post/2017-06-10-temp-long-loan/figure-html/bad_debt_2014-1.png)

![Estimated bad debt by term length stratified by risk band, for 2015](/post/2017-06-10-temp-long-loan/figure-html/bad_debt_2015-1.png)

![Estimated bad debt by term length stratified by risk band, for 2016](/post/2017-06-10-temp-long-loan/figure-html/bad_debt_2016-1.png)

This blog series is bi-weekly, please comment with suggestions of topics. The code for this post can be found at the [Github repo](https://github.com/seabbs/funding_circle)
