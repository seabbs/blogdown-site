---
layout: page
title: About
permalink: /about/
show_meta: true
# imagefeature path is relative to images/ directory.
imagefeature: samabbott.jpg
published: true
description: "About example.com...."
category: views
comments: false
mathjax: false
noindex: false
sitemap:
    priority: 0.7
    changefreq: 'monthly'
    lastmod: 2016-02-13
# tags will be used as html meta keywords.    
tags:
  - "Sam Abbott"
---

<div class="post-author text-center">                       
            <img src="{{ site.urlimg }}{{ site.owner.avatar }}" alt="{{ site.owner.name }}'s photo" itemprop="image" class="post-avatar img-circle img-responsive"/> 
<a href="{{ site.url }}/cv">{{ Curriculum Vitae }}</a>
<a href="{{ site.url }}/about/publications/" class="social-icons" title="Publications"><i class="fa fa-file-pdf-o"></i></a>
<a href="{{ site.url }}/about/projects/" class="social-icons" title="Projects"><i class="fa fa-file-code-o"></i></a>
</span>
</div>


 <a class="sidebar-nav-item{% if page.url == link.url %} active{% endif %}" href="{{ site.url }}{{ link.url }}">{{ link.title }}</a>
I am a mathematical modeller interested in developing and fitting models for infectious disease, using data driven approaches. I studied mathematics at the University of Durham, completing an MMath degree in 2014. I then completed a masters in advanced mathematical biology at the University of York. As part of my thesis project I spent a summer at the university of Glasgow, studying the patterns of drug resistance in E-coli. across various species in Tanzanaia. I am currently completing a PhD in social medicine at the University of Bristol, studying the deployment of the BCG vaccine in the UK.
