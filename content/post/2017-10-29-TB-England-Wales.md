---
title: Tuberculosis Incidence and Interventions in England and Wales, 1913-2016
author: ~
date: '2017-10-29'
slug: Tb-England-Wales
twitterImg: img/TB_England_Wales.png
description: "An interative dashboard exploring publicly available TB incidence data for England and Wales in the context of interventions"
categories: ["R"]
tags: ["data analysis", "data visualisation", "rstats", "TB", "infectious disease"]
---

This interactive dashboard uses data on Tuberculosis incidence from 1913-1916 [released](https://www.gov.uk/government/publications/tuberculosis-tb-annual-notifications-1913-onwards) by Public Health England and combines it with data on the interventions against Tuberculosis that have been discovered/implemented over the last century. The data was cleaned and imported into R using the [tbinenglanddataclean](https://www.samabbott.co.uk/tbinenglanddataclean/) R package, which also contains information on how to apply for additional data, scripts to clean data extracts and graphing functions to visualise them. The dashboard is a work in progress and additional interventions, new figures and increased interactivity will be added over time. For a full page view of the dashboard see [here](http://www.seabbs.co.uk/shiny/TB_England_Wales).

<iframe src="http://seabbs.co.uk/shiny/TB_England_Wales" style="border: none; width: "100%"; height: 1000px"></iframe>
