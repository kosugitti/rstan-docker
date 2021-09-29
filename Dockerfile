FROM rocker/verse:latest
LABEL maintainer="kosugitti@gmail.com"  \
	org.label-schema.vcs-url="https://github.com/kosugitti/rstan-docker"

# Using clang to compile Stan
# Using the default g++ causes memory issues
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	clang

# Install ipaexfont
RUN apt-get update
RUN apt-get install -y fonts-ipaexfont

# install libjpeg & V8 for "psycho"
RUN apt-get install -y libjpeg-dev libv8-dev

# install ImageMagick++ library for magick
RUN apt-get install -y libmagick++-dev

# install clang for Rstan
RUN apt-get install -y clang make

# Install JAGS and other linux packages
RUN apt-get update && apt-get install -y \
	cargo \
	jags \
	gdal-bin \
	libudunits2-dev \
	libgsl0-dev \
	libprotobuf-dev \
	libglpk-dev \
	libcgal-dev \
	libglu1-mesa-dev \
	libgdal-dev \
	libproj-dev \
	libgeos-dev \
	openmpi-bin \
	proj-data \
	proj-bin \
	tcl8.6-dev \
	tk8.6-dev \
	libhiredis-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*


# install_stan.R creates a makevars file and installs rstan from source
# following the instructions at https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Linux

COPY install_stan.R install_stan.R
RUN ["r", "install_stan.R"]

# Installing the rest 
### To use cache in local compile, devide install2.r code
RUN install2.r --skipinstalled --error --d TRUE --ncpus -1 \
	bayesplot \
	bridgesampling \
	brms \
	blavaan \
	broom \
	caret \
	Cairo \
	coda \
	colorBlindness 

RUN install2.r --skipinstalled --error --d TRUE --ncpus -1 \
	e1071 \
	effectsize \
	extraDistr \
	formattable \
	ggmcmc \
	GGally \
	GPArotation \
	gtsummary \
	h2o

RUN install2.r --skipinstalled --error --d TRUE --ncpus -1 \
	knitr \
	lavaan \
	lme4 \
	mlr \
	mvoutlier \
	psych \
	randomForest \
	rstantools 

RUN install2.r --skipinstalled --error --d TRUE --ncpus -1 \
	shinystan \
	summarytools \
	tidyverse \
	tidybayes 

# Install from github
RUN installGithub.r ykunisato/senshuRmd 
RUN installGithub.r ykunisato/jpaRmd