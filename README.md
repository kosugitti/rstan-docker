# rstan-docker

研究教育用の Docker パッケージを作ります。
RStudio Server に rstan やその周辺の便利パッケージが入っている環境を安定的に提供することが目的です。

# 使い方

```
docker run -e PASSWORD=password -p 8787:8787 -v $(pwd):/home/rstudio -d --name name_of_container kosugitti/rstan-env
```

# 含まれる R パッケージ

- BiocManager
- graph
- Rgraphviz
- cmdstanr
- bayesplot
- bridgesampling
- brms
- blavaan
- broom
- caret
- Cairo
- coda
- colorBlindness
- e1071
- effectsize
- extraDistr
- formattable
- ggmcmc
- ggExtra
- GGally
- GPArotation
- gtsummary
- knitr
- loo
- lavaan
- lme4
- mlr
- psych
- randomForest
- rstantools
- shinystan
- summarytools
- tidyverse
- tidybayes
- senshuRmd
- jpaRmd

※エラーが出るので rstanarm パッケージは除外しています（2021/09/29 現在）
