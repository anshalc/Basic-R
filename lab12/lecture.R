library(tidyverse)

set.seed(42)
n <- 100
x1 <- rnorm(n); x2<-rnorm(n)
y1 <- x1 + rnorm(n,sd=.5); y2 <- x1+x2+rnorm(n,sd=.5)
y3 <- x2 + rnorm(n,sd=.5); y4 <- rnorm(n,sd=.5)
rr <- list(fit1 = lm(y1 ~ x1+x2),
           fit2 = lm(y2 ~ x1+x2),
           fit3 = lm(y3 ~ x1+x2),
           fit4 = lm(y4 ~ x1+x2))
coef(rr$fit1)

#ex1
set.seed(42)
n <- 100
x1 <- rnorm(n); x2<-rnorm(n)
y1 <- x1 + rnorm(n,sd=.5); y2 <- x1+x2+rnorm(n,sd=.5) 
y3 <- x2 + rnorm(n,sd=.5); y4 <- rnorm(n,sd=.5)
rr <- list(fit1 = lm(y1 ~ x1+x2), 
           fit2 = lm(y2 ~ x1+x2), 
           fit3 = lm(y3 ~ x1+x2), 
           fit4 = lm(y4 ~ x1+x2) )
class(rr) <- "lm_vec"

coef.lm_vec <- function(rr) {
  for(i in seq_along(rr)) {
    print(coef(rr[[i]]))
  }
}
coef(rr)

rr %>% map(coef) %>% map_dbl("x1") 
