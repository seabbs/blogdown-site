---
layout: post
title: Visualising the funding circle loanbook
# date element overrides date in title format.
date: 2017-01-18
description: "First blog post looking at the P2P lender funding circle, with some initial visualisations"
comments: true
tag:
  - P2P
  - blog
  - visualisation
  - FC
---


This is the first in a series of blog posts looking at P2P lenders, which will be aimed at surfacing more details about the structures of their loan books. I hope to expand this series by looking at optimal strategies, predictive modelling, and interactive data science.

Since 2005, with the launch of [Zopa](www.zopa.co.uk) P2P companies have provided a middle path between cash holdings, and investing in stocks and shares. Funding circle, which was launched in 2010, has currently facilitated over £1 Billion in loans to British businesses. It has also returned on average 6.6% after the exclusion of bad debt, fees etc.

The platform offers small, and medium businesses loans of up to £1 million, for up to 60 months. Whole or fractional loans are then purchased by individuals/institutions. Since September 2015 loans have been offered with fixed rates determined by FC using the risk category of the company, and the loan terms. There is also a secondary market where individuals can sell loan parts, for a 0.25% fee, at a premium, at parity, or at a discount. Prior to September 2016 loans were auctioned with no fixed rate. 

FC allows the investor to hand pick each loan that they invest in, and the level of your exposure. However investors can also use an automated auto-bid tool that automatically buys loans, on both the primary and secondary markets, based on pre-set options specified by the investor. These include selecting risk levels to lend to, selecting rates to buy loans on the secondary market, and specifying a target maximum exposure to any single loan. These two system lead to a tension, with those that are hand-picking loans being potentially able to manipulate the auto-bid algorithm acting for other investors. As part of this blog series I will be looking further into these strategies. 

Now for some simple visualisations of the FC loan book, with the first step being to load the required packages (unhash for first run). 


```r
#install.packages('tidyverse')
library(tidyverse)

#install.packages('lubridate')
library(lubridate)

#install.packages('stargazer')
library(stargazer)
```

Now to load in the data and display the variable names:


```r
## File path of loanbook 
df_path  <- '~/data/Funding_circle/loanbook.csv'

## Load data with miss spec as N/A
loanbook <- read_csv(df_path, na='N/A')

## var to factors
factor_list <- c('status', 'credit_band', 'loan_purpose', 'sector', 'business_type_name', 'region_name', 'whole_loan', 'repayment_type', 'security_taken')
                 
                 
format_factors <- function(factor_list, df){
                   for (var in factor_list)
                   {
                     df[[var]] <- factor(df[[var]])
                   }
                   
                   return(df)
}
loanbook <- format_factors(factor_list, loanbook)
```

We print the simple summary of the data as a first step (hidden for brevity). 

```r
summary(loanbook)
```
As the loan book has evolved with time an immediate question is how the number of loans, at each risk level has changed with time. Across all risk bands we see that year on year loan acceptances have increased, with 2016 showing by far the largest growth. Notably we see the introduction of D loans in 2013, and the introduction of E loans in 2015. The vast majority of funding circle loans are with 'low risk' borrowers (i.e A, and A+), although the number of risky loans is now greater than the entire loan book in 2014
 

```r
 #Plot incidence - by year
loanbook %>% 
    mutate(month = floor_date(loan_accepted_date, "month")) %>%
        count(month, credit_band) %>% 
        ggplot(aes(x=month, y=n, fill=credit_band)) + 
          geom_area() -> p1
p1
```

![]({{ site.urlimg }}/blog_post_files/figure-html/1.png)<!-- -->

We now aggregate by month so that we can understand patterns of loan acceptances across the risk bands. For all risk bands we see that there is a increasing trend towards the end of the year, with the fewest loans originated in April, and March, indicating that this may not be a good time to move funds into FC, and consequently this may lead to an up-tick in the secondary market. E loans show the strongest growth in the second half of the year - however this may be an artefact of their relatively recent introduction, which maybe responsible for this apparent trend. 


```r
loanbook %>%
        mutate(month = month(loan_accepted_date, label=TRUE)) %>%
        ggplot(aes(x=month)) + 
          geom_bar() + 
            facet_wrap(~credit_band, scale='free') + 
            theme(axis.text.x = element_text(angle=45)) -> p2
p2
```

![]({{ site.urlimg }}/blog_post_files/figure-html/2.png)<!-- -->


Finally we aggregate by day. There is limited evidence here that loan acceptances vary between weekdays, with a slight upward tick mid week.


```r
loanbook %>%
        mutate(day = wday(loan_accepted_date, label=TRUE)) %>%
        ggplot(aes(x=day)) + 
          geom_bar() + 
            facet_wrap(~credit_band, scale='free') + 
            theme(axis.text.x = element_text(angle=90)) -> p5
p5
```

![]({{ site.urlimg }}/blog_post_files/figure-html/3.png)<!-- -->

To link these trends to demand from investors we plot the average interest rate of each accepted loan. We see that average rates are linked with supply for historic loans that were accepted using the biding system. However as expected since the introduction of the fixed rate loan system supply is now uncoupled from price, this presents possible advantages for the hand-picking investor who can buy loans at times of peak supply and sell loans at times of scarcity at a premium on the secondary market.


```r
plot_monthly_risk_band <- function(df, years)
{
  df %>%
        mutate(month = month(loan_accepted_date, label=TRUE)) %>%
           mutate(year = year(loan_accepted_date)) %>% 
                filter(year %in% years) %>% 
                   group_by(month, credit_band, year) %>% 
                      summarise(`Avg interest rate`=mean(interest_rate)) %>% 
                          ggplot(aes(x=month, y=`Avg interest rate`, shape=credit_band, color=credit_band, fill=credit_band, group=credit_band))  +
                              geom_line() +
                                facet_wrap(~year, scale='free') +
                                  theme(axis.text.x = element_text(angle=45)) -> p
  return(p)
}

p3 <- plot_monthly_risk_band(loanbook, c(2010:2013))
p4 <- plot_monthly_risk_band(loanbook, c(2014:2016))
p3
```

![]({{ site.urlimg }}/blog_post_files/figure-html/4.png)<!-- -->

```r
p4
```

![]({{ site.urlimg }}/blog_post_files/figure-html/5.png)<!-- -->


This blog series will be bi-weekly, please comment with suggestions of topics. The code for this post can be found at the [Github repo](https://github.com/clapping-bunny/funding_circle)

