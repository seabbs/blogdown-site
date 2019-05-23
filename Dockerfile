## Start with the tidyverse docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

RUN apt-get install -y \
    libproj-dev \
    libgdal-dev \
    && apt-get clean
 
## Get JAVA
RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install \
    default-jdk \
    default-jre \
  && R CMD javareconf

## Install deps
RUN apt-get update -y && \
    apt-get install -y \
    texlive-latex-recommended \
    texlive-fonts-extra \
    texinfo \
    libqpdf-dev \
    libmagick++-dev \
    && apt-get clean
    
## Add in website files
ADD . /home/rstudio/seabbs.github.io

RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("Biobase")'
RUN Rscript -e 'devtools::install_github("yihui/xfun")'
RUN Rscript -e 'devtools::install_github("rstudio/blogdown")'

## Get Blogdown
RUN Rscript -e  'blogdown::install_hugo()'

## Get h2o deps
RUN Rscript -e 'install.packages(c("RCurl","jsonlite"))'

## Get latest release of h2o
RUN Rscript -e 'install.packages("h2o", type="source", repos="http://h2o-release.s3.amazonaws.com/h2o/latest_stable_R")'
 
 ## Get Patchwork
RUN Rscript -e 'devtools::install_github("thomasp85/patchwork")'

## Config for GitHub
RUN git config --global user.email "signin@samabbott.co.uk"
RUN git config --global user.name "seabbs"

