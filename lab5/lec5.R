library(tidyverse)
library(nycflights13)
dd<-data.frame(X=c(NA,10,1),Y=c("ONE","TWO","THREE"))
dd
tt<-tibble(x=c(NA,10,1),y=c("one","two","three"))
tt
as_tibble(dd)

as.data.frame(tt)
flights
View(flights)
dd$X
tt$x

dd[["X"]]

tt[,"x"] #returns a vector
dd[,c("X","Y")]

tt[2,]
tt[1:2,] 
tt[2:3,]
hiv<-read_csv("HIVprev.csv")


myd<-data.frame(X=c("cat","dog","mouse"))
a1 <- c("cat","dog","bird","fish")
a2 <- c("cat","tiger")
myd[,names(myd) %in% a1]
myd[,names(myd) %in% a2]
names(myd)


chic<- read_csv("chicken.C")
chic

