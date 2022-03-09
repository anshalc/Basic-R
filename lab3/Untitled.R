library(tidyverse)
library(gapminder)
hiv<-read.csv("HIVprev.csv",stringsAsFactors = FALSE)
hiv<-select(hiv,Country,year,prevalence)
head(hiv)
#1

p<-ggplot(hiv,aes(x=year,y=prevalence,colour=prevalence))+geom_line(aes(group=Country))
p+ggtitle("Estimated HIV Prevalence 1990-2000")+labs(y="estimated prevalence")

#2
x<-ggplot(hiv,aes(x=year,y=prevalence,group=Country))+geom_smooth(color="orange")
x+labs(y="estimated prevalence (%)")

#3
cc <- c("Botswana","Central African Republic","Congo","Kenya","Lesotho","Malawi",
        "Namibia","South Africa","Swaziland","Uganda","Zambia","Zimbabwe")
hihiv <- filter(hiv,Country %in% cc)
ggplot(hiv,aes(x=year,y=prevalence))+
  geom_line(data=hihiv,color="blue",alpha=0.3,aes(group=Country))+
  geom_smooth(data=hihiv,colour="orange")+
  geom_line(color="grey",alpha=0.3,aes(group=Country))+
  geom_smooth(color="orange")

