library(tidyverse)
library(nycflights13)

station <- read_csv("station.csv",col_types=cols(ID=col_integer()))

stats <- read_csv("stats.csv",col_types=cols(ID=col_integer()))

#multiple tables
station
stats
print(airlines,n=3)
print(airports,n=3)
print(planes,n=3)
print(planes,n=4)3
#video2
#Ex2 video 
flights %>%
  count(year,month,day,flight,tailnum)%>%
mutate(flight_id=row_number()) %>%
  filter(n>1)%>%print(n=5)

#video 3
stats%>% left_join(station)
station<-station[-3,]
stats%>%left_join(station) 
stats%>%inner_join(station)
flights2<-flights %>%
  select(year:day,hour,origin,dest,tailnum,carrier)
flights2
flights2%>%left_join(weather)

flights2%>%left_join(planes,by="tailnum")
flights2%>%left_join(airports,by=c("dest"="faa"))

#ex3

#video4
top_dest <- flights2 %>% count(dest,sort=TRUE) %>% head(n=10)
print(top_dest,n=4)

#old way to semi join 
flights2%>% filter(dest %in% top_dest$dest) %>% print(n=4)

flights2 %>% semi_join(top_dest) %>% print(n=4)

#ex4
airports %>%
  semi_join(flights, c("faa" = "dest"))

