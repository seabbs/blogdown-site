
<!-- README.md is generated from README.Rmd. Please edit that file -->
samabbott.co.uk
===============

[![Build Status](https://travis-ci.org/seabbs/seabbs.github.io.svg?branch=master)](https://travis-ci.org/seabbs/seabbs.github.io)

This is the source code of [samabbott.co.uk](http://www.samabbott.co.uk/blogdown-site) Blog posts can be found in the `content/post/` directory

Project Requirements
--------------------

This site is built with the [**blogdown** package](https://github.com/rstudio/blogdown), and [Hugo](https://gohugo.io/), which can be installed using `blogdown::install_hugo()`.

The blog is built on the [hugo-academic](https://github.com/gcushen/hugo-academic) theme.

Docker
------

This website is built in a container using the [tidyverse](https://hub.docker.com/r/rocker/tidyverse/) docker image. To run the docker image run:

``` bash
docker run -d -p 8787:8787 --name seabbs.github.io -e USER=seabbs -e PASSWORD=seabbs seabbs/seabbs.github.io
```

The rstudio client can be found on port `:8787` at your local machines ip. The default username:password is seabbs:seabbs, set the user with `-e USER=username`, and the password with `- e PASSWORD=newpasswordhere`. The default is to save the analysis files into the user directory.

To run a plain R terminal use:

``` bash
docker run --rm -it --user seabbs seabbs.github.io /usr/bin/R
```

To run a plain bash session:

``` bash
docker run --rm -it --user seabbs seabbs.github.io /bin/bash
```

To connect as root:

``` bash
docker exec -ti -u root seabbs.github.io bash
```
