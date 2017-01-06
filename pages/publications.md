---
layout: publ
category: 
permalink: /about/publications/
title: "Publications"
published: true
description: "List of publications"
tags:
  - papers
  - articles
  - research
comments: true
modified: "2016-10-6"
bibtex: "/files/mypubs.bib"
show_meta: true
noindex: false
nofollow: true
sitemap:
    priority: 0.5
    changefreq: 'monthly'
    lastmod: 2016-10-6
style: |
  .container {
        max-width: 48rem;
    } 
---

{% comment %}
<!-- bibbase.org should work with following code unless you are hosting domain over https. --> 

{% if page.bibtex %}
 {% if page.bibtex contains 'http' %}
  {% assign domain = '' %}
  {% else %}
  {% assign domain = site.url %}
 {% endif %}
 {% capture biburl %}{{ domain }}{{ page.bibtex }}{% endcapture %}
<script src="http://bibbase.org/show?bib={{ biburl | cgi_escape }}&amp;jsonp=1&amp;authorFirst=1"></script>
{% endif %}

{% endcomment %}
