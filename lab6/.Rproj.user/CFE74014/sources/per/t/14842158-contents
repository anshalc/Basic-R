#video 1.
library(tidyverse)
table1 <- read_csv("lec06table1.csv",
                   col_types=cols(
                     country=col_character(),
                     year=col_integer(),
                     cases=col_integer(),
                     population=col_integer()
                   )
)
#create tibbles used in examples.
table2 <- table1 %>%
  gather(cases,population,key="type",value="count") %>%
  arrange(country,year)
table3 <- table1 %>%
  mutate(rate = paste(cases,population,sep="/")) %>%
  select(-cases,-population)
table4a <- table1 %>%
  select(country,year,cases) %>%
  spread(key=year,value=cases)
table4b <- table1 %>%
  select(country,year,population) %>%
  spread(key=year,value=population)

#tidy table.
table1
#untidy table
print(table2,n=6)

#adding a new column rate 
table1 %>% mutate(rate=cases/population*100000)
#summary 
table1 %>% group_by(year) %>% summarize(sum(cases))
#plot 
ggplot(table1,aes(x=year,y=cases,color=country)) + geom_point()

## Ex rate from table 2.
t2cases<-filter(table2,type=="cases")
t2pop<-filter(table2,type=="population")
t2cases<-select(t2cases,count)
t2pop<-select(t2pop,count)
t2rate<-t2cases/t2pop
view(t2rate)


#video2.
#gathering to make it tidy 
table4a %>% gather(`1999`,`2000`,key=year,value=cases)
#repeat for table4b
table4b %>% gather(`1999`,`2000`,key=year,value=cases)

#Billboard Top 100 rankings of songs
bb<-read_csv("billboard.csv")
bb
bb <-
  bb %>% select(-time,-genre) %>%
  rename(artist = artist.inverted)
bb
bb %>% gather(x1st.week:x76th.week,key=week,value=rank,na.rm=TRUE) %>%
  mutate(week= parse_number(week)) %>% # replace, e.g., x1st.week with 1, ...
  arrange(artist,track,week)

#spreading
table2
table2 %>% spread(key=type,value=count)

#ex select country year and cases from table 1 and use spread.
table1
table1 %>% spread(key=country,value=year)

#video3
print(table3,n=4)
table3 %>% separate(rate,into=c("cases","population"),sep="/") %>% print(n=4)

print(table3,n=4)
table3 %>% separate(rate,into=c("first","remainder"),sep=1)

table3 %>% separate(rate,into=c("cases","population"),sep="/",
                    convert=TRUE)

bb %>% select(track,x23rd.week:x25th.week) %>% print(n=4)

stocks <- tibble( year=c(2015,2016,2016), qtr = c(1,1,2),
                  return = c(1.0,2.0,3.0))
stock
stocks %>% spread(key=year,value=return)
stocks %>% complete(year,qtr)

#video4
tb <- read_csv("tb.csv")
tb <- select(tb,-new_sp, -contains("04"), -contains("514"),
             -new_sp_mu, -new_sp_fu)
tblong <- tb %>%
  gather(new_sp_m014:new_sp_f65,key=demog,value=count,na.rm=TRUE)
tblong
tb
maxlen <- max(nchar(tblong$demog))
tb <- tblong %>% mutate(demog = substr(demog,8,maxlen)) %>%
  separate(demog, into=c("gender","agecat"),sep=1)
tb
