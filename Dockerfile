## Start with the tidyverse docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

ADD . /home/rstudio/seabbs.github.io

RUN Rscript -e 'devtools::install_github("rstudio/blogdown")'

RUN Rscript -e  'blogdown::install_hugo()'

RUN git config --global user.email "signin@samabbott.co.uk"
RUN git config --global user.name "seabbs"
