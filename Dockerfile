## Start with the tidyverse docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

ADD . /home/seabbs/seabbs.github.io

RUN apt-get update && \
    apt-get install -y \
    libxml2-dev \
    && apt-get clean

RUN Rscript -e 'install.packages("devtools")'

RUN Rscript -e 'devtools::install_github("rstudio/blogdown")'

RUN Rscript -e 'blogdown::install_hugo()'

RUN git config --global user.email "signin@samabbott.co.uk"
RUN git config --global user.name "Sam Abbott"
