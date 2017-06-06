#!/bin/sh


Rscript -e "blogdown::install_hugo(); blogdown::build_site(local = FALSE, method = 'html_encoded')"