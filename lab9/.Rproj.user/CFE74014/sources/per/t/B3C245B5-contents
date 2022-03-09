library(tidyverse)
library(forcats)
library(lubridate)
library(nycflights13)
x1 <- c("dog","cat","mouse"); x2 <- factor(x1); x2
x1 <- c(3,4,1); x2 <- factor(x1); x2
x1 <- c(TRUE,FALSE,TRUE); x2 <- factor(x1); x2


x1 <- c("dog","cat","mouse"); x2 <- factor(x1)
str(x2)

yvr <- read_csv("weatherYVROct2019.csv") %>%
  select("Date/Time",Year,Month,Day,Time,"Temp (C)")
yvr
yvr <- yvr %>% mutate(`Date/Time` =
                        ymd_hm(`Date/Time`,tz="America/Vancouver"))
yvr
yvrdt <- yvr %>%
  mutate(datetime =
           make_datetime(Year,Month,Day,hour(Time),minute(Time),
                         tz = "America/Vancouver")) %>%
  select(`Date/Time`,datetime)
yvrdt
