#!/bin/sh


Rscript -e "blogdown::build_site(local = FALSE, method = 'html')"
