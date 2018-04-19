## Start with the tidyverse docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

RUN apt-get install -y \
    libproj-dev \
    libgdal-dev \
    && apt-get clean
    
ADD . /home/rstudio/seabbs.github.io

RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("Biobase")'
RUN Rscript -e 'devtools::install_github("rstudio/blogdown")'

RUN Rscript -e  'blogdown::install_hugo()'

RUN git config --global user.email "signin@samabbott.co.uk"
RUN git config --global user.name "seabbs"
