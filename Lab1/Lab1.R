install.packages("gapminder")
install.packages("dplyr")
install.packages("ggplot2")
library(gapminder)
library(dplyr)
library(ggplot2)
head(gapminder)
tail(gapminder)
summary(gapminder)
gapminder07 <- filter(gapminder, year == 2007)
head(gapminder07)
summarize(gapminder07,median(lifeExp))
by_cont <- group_by(gapminder07, continent)
summarise(by_cont, median(lifeExp))
medL <- summarize(by_cont, median(lifeExp))
plot(medL)
filter(gapminder07,continent == "Oceania")
medL <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(medLifeExp = median(lifeExp))

medLA <- gapminder %>%
  filter(continent == "Africa") %>%
  group_by(country) %>%
  summarise(medLifeExp = median(lifeExp))
filter(medLA,medLifeExp<40)
filter(medLA,medLifeExp>60)
cc = c("Angola","Guinea-Bissau","Sierra Leone",
       "Mauritius","Reunion","Tunisia",
       "Mexico") # Mexico for comparison
gapminder %>%
  filter(country %in% cc) %>%
  ggplot(aes(x=year,y=lifeExp,color=country)) +
  geom_point() +
  geom_smooth(method = "lm")

qplot(gdpPercap,lifeExp,data=gapminder07)
ggplot(gapminder07, aes(x=gdpPercap,y=lifeExp,color=continent)) +
  geom_point() +
  geom_smooth(method = "lm", se=FALSE)

