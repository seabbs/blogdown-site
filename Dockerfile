## Start with the tidyverse docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

ADD . /home/seabbs/seabbs.github.io

RUN Rscript -e 'install.packages("devtools")'

RUN Rscript -e 'devtools::install_github("rstudio/blogdown")'

RUN Rscript -e 'blogdown::install_hugo()'