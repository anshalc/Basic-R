library(tidyverse)
hiv <- read_csv("HIVprevRaw.csv")
hiv
#question_1
colnames(hiv)[1] <-"Country"
hiv
#question_2
hiv <- select(hiv,-"1979":-"1989")
hiv
#question_3
hiv%>% gather("1990" : "2011",key=year,value=prevalence,na.rm=TRUE)
