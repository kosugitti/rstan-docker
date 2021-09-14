# Following instructions from
# https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Linux

print("Running install_stan.R")

## Creating /home/rstudio/.R/Makevars

dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC",
  "CXX14=clang++",
  file = M, sep = "\n", append = TRUE
)

## Installing rstan
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("genefilter")
BiocManager::install("graph")
BiocManager::install("Rgraphviz")

install.packages("rstan", type = "source")


install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))

#install.packages(pkgs ="https://cran.r-project.org/src/contrib/Archive/CoxBoost/CoxBoost_1.4.tar.gz",
# , type="source", repos=NULL)

install.packages(c("pcaPP", "mvoutlier", "glasso", "matrixcalc"))

url <- "https://cran.r-project.org/src/contrib/Archive/rrlda/rrlda_1.1.tar.gz"
pkgFile <- "rrlda_1.1.tar.gz"
download.file(url = url, destfile = pkgFile)
install.packages(pkgs=pkgFile, type="source", repos=NULL)
unlink(pkgFile)
