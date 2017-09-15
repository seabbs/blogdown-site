---
title: Deep Dive; Property Partner July 2017 Open House Resale Data
author: ~
date: '2017-09-15'
slug: deep-dive-pp-open-house
categories: []
tags: ["P2P", "data analysis", "data visualisation", "rstats", "deep dive"]
---

As peer to peer lending matures platforms have begun to have increasingly divergent stances on sharing their data, making it increasingly important that their is external pressure on them to improve their data sharing. This blog series will focus on platforms sharing their data, exploring what their data is saying and suggesting possible changes to their releases that would make it easier for investors to gain insights on their own.

For the first post I will be focussing on data from [Property Partner](https://www.propertypartner.co/aboutus#/ourstory), which is a property crowd-funding site that started in 2014 and allows investors to buy small stakes in a range of properties. The data I will be using was released as part of Property Partner's [July 2017 open house data](https://resources.propertypartner.co/open-house-july-2017/) blog, and contains information on resale's of their property portfolio. This post will reproduce and update previous work, explore the underlying trends, and suggest possible changes for future releases. All code is available [here](https://github.com/seabbs/propertypartner) and the data can be downloaded from this [link](https://d2ofd11qqzygs0.cloudfront.net/files/purchases-on-resale-july-2017-open-house.zip).

As a starting point I have reproduced a graph of Transactions (£) over time first published [here](https://p2pblog.co.uk/property-partner-trading-analysis/). This shows the increase in transactions (£) over time on the resale market, with a continuous increase in volume until early 2016 from which point seasonal variation has dominated. I have also stratified by transaction type, revealing the impact of the recently introduced bidding system, which has steadily increased it's share of transactions month on month.


<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig1.html" width = "100%" height="500" id="iframe_container"></iframe>

The plot naturally leads to the following question - is the increase in trading volume driven by an increasing number of trades or by changes in the size of trades being made? The following plot explores this by plotting the number of transactions over time. We see that the early growth in volumes was likely driven by an increasing number of trades but that variation since then is more strongly linked to changes in trade size.

<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig2.html" width = "100%" height="500" id="iframe_container"></iframe>


Now that we understand how transactions (N) have varied with time we need to explore the underlying trends. The most obvious question is which properties are being traded for the most, and if possible why do these properties have so much turn over? The following plot shows trades by property, stratified by year. For the first year of trading we see that a few properties (as the portfolio was small) dominated the number of trades made. In 2016 trading was spread over more properties but with fewer trades per property. So far for 2017 there has been a greatly reduced number of trades, with trading becoming increasingly homogeneous across the  portfolio. Unfortunately the extract published by Property Partner has little detail about properties so establishing why properties are traded at different rates is difficult. Whilst I could in principle join the various data sets they produce, without a unique ID this would be difficult and prone to errors!

<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig3.html" width = "100%" height="500" id="iframe_container"></iframe>


As the number of transactions is relatively stable, but the volume of transactions has increased, therefore size of transactions must have changed over time. To explore this I have plotted transactions (£) over time stratified by binned transaction size. As transaction size increases there is greater seasonal variation, which indicates that both large and small traders are key drivers of Property Partner's trading volume with larger trades providing the year on year growth and smaller trades acting to smooth seasonal variability. Since January 2016 there has been little growth in small trades, with larger trades becoming increasingly common. However, the largest trades (£5,000-£49,999) peaked in early 2016 since when they have been decreasing year on year (although this trend is obscured by seasonal variation).

<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig4.html" width = "100%" height="500" id="iframe_container"></iframe>

Whilst the binned transaction sizes used above were helpful in quickly visualising the changes transactions (£) by size they are arbitrary and may be obscuring underlying changes. The following plot explores this by plotting the distribution of transactions sizes within each binned transaction size. This plot contains a large amount of condensed information, the salient points are that mid-size trades (£100-£499) have shifted from being primary around £200 to being relatively equally distributed across the range, large trades (£500-£999) have become increasingly bi-model, and very high value transactions (£20,000+) have become more common as a subset of high value transactions (£5,000-£49,999).

![](/post/2017-09-15-deep-dive-pp-open-house/figure-html/trans-size-1.png)<!-- -->

Another approach to visualising changing transaction size over time, is to plot the proportion of trades (by number) for each binned transaction size. As indicated in the previous plots, this shows that larger trades have become increasingly common, with the large trades (£1000-£4,999) increasing to 2% of manual trades, and  5% of matched bids in 2017. The most common trade size is still small (£1-£99), but the proportion of very small trades  (£0-£1) has drastically reduced. Matched bids are more likely to be larger transactions with small trades (£1-£99) making up 54% of transactions compared to 68% of manual orders.

<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig5.html" width = "100%" height="500" id="iframe_container"></iframe>


The data released by Property Partner also contains information about the unit price each transaction was made at, and what premium this was against both the latest and original valuation. As this data is provided across all properties in the portfolio a single visualisation of the data may not indicate the underling relationship. A first step is to plot the monthly average (weighted by transaction size) premium on latest valuation for each property in the portfolio, by comparing premiums on latest valuation rather than raw share price properties can be compared against each other. This plot indicates a general
downward trend in premiums but is difficult to interpret due to the number of properties in the portfolio.

<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig6.html" width = "100%" height="500" id="iframe_container"></iframe>


To explore this apparent trend a first step is to look at the trends in premiums across the Property Partner portfolio, using the mean premium across all properties. This indicates that premiums were originally high but have decreased over time, and since the beginning of 2016 have been negative on average. As with transactions (£) seasonal dynamics now appear to dominate with premiums being relatively stable year on year.

<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig7.html" width = "100%" height="500" id="iframe_container"></iframe>


As we have averaged across all properties in the Property Partner portfolio the relationship we have identified between year and premium may be confounded by a variety of factors. An obvious question is whether the quality of property purchased by Property Partner has changed over time (if we assume that premium over latest valuation is a good proxy of property quality). The plot below looks at the average weighted premium for properties made available for resale in each year (this is confounded by the rate properties are made available in a given year). From this plot we see that across all years of trading (except 2014) properties start with a small positive premium, which then gradually declines with time. Properties from 2014 have bucked this trend, which is likely due to the novelty of owning a property from the early days of Property Partner. Properties from 2015 have a linear relationship between premium and time, trading increasingly below their valuation. Properties from 2016 suffered a rapid reduction in premium, indicating a possible reduction in property quality, although this has now stabilised. So far properties from 2017 have held positive premiums, with little reduction over time.

<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig8.html" width = "100%" height="500" id="iframe_container"></iframe>


As a final plot for this blog post I have reproduced another plot from [this post](https://p2pblog.co.uk/property-partner-trading-analysis/) (from the [p2pblog.co.uk](https://p2pblog.co.uk/)), which is well worth a read.

<iframe seamless src="../../post/2017-09-15-deep-dive-pp-open-house/fig9.html" width = "100%" height="500" id="iframe_container"></iframe>

To see the current state of the Property Partner Portfolio you can explore for youself [using this Tableau dashboard.](https://public.tableau.com/views/PropertyPartnerPortfolioVisualisation/PropertyPartnerPortfolio?:embed=y&:display_count=yes)

<div class='tableauPlaceholder' id='viz1505484367745' style='position: relative'><noscript><a href='#'><img alt='Property Partner Portfolio ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Pr&#47;PropertyPartnerPortfolioVisualisation&#47;PropertyPartnerPortfolio&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='site_root' value='' /><param name='name' value='PropertyPartnerPortfolioVisualisation&#47;PropertyPartnerPortfolio' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Pr&#47;PropertyPartnerPortfolioVisualisation&#47;PropertyPartnerPortfolio&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1505484367745');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>

As a final note whilst it is great that Property Partner releases data this analysis was limited by the quality of the data published. If their is interest in more of these deep data dives then I would suggest contacting the peer to peer platforms that you invest in and asking that a live data extract be made available, without a login or extensive user agreement. This would ideally contain a unique ID for each loan/property etc, information on both primary and secondary market transactions, and metadata about each loan/property; such as location, type, value, etc. If you want to know more about analysis ready data then see [here](http://vita.had.co.nz/papers/tidy-data.html). 

