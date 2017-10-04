# set up working directory
setwd("C:\\Users\\james.hooi\\Documents\\data analytics\\Springboard FDS exercises\\Ex4.0.1 Exploratory Data Viz\\FDS-Ex4-titanic")


# load data viz package and dplyr
library(ggplot2)
library(dplyr)

# use cleaned titanic data set from Ex 3.1.2
titanic.clean <- read.csv(file = paste(getwd(),"titanic_clean.csv",sep="\\"))
titanic <- titanic.clean %>% 
  select(Survived = survived, Pclass = pclass, Sex = sex, Age = age)


# titanic is avaliable in your workspace
# 1 - Check the structure of titanic
str(titanic)
  # 1a - Clean up factor variable Sex
  titanic <- titanic %>% filter(Sex != "")  

# 2 - Use ggplot() for the first instruction
ggplot(titanic, aes(x = Pclass, fill = Sex)) + 
  geom_bar(position = "dodge") +
  labs(x = "Passenger Class", y = "Count", title = "Bar plot: Passenger survival by class, by sex")

# 3 - Plot 2, add facet_grid() layer
ggplot(titanic, aes(x = Pclass, fill = Sex)) + 
  geom_bar(position = "dodge") +
  facet_grid(. ~ Survived) +
  labs(x = "Passenger Class", y = "Count", title = "Bar plot: Passenger survival by class, by sex"
       , subtitle = "LHS: did not survive, RHS: survived")

# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)
# 5 - Plot 3, but use the position object from instruction 4
ggplot(titanic, aes(x = Pclass, y=Age, col = Sex)) + 
  geom_point(position = posn.jd, size=3, alpha=0.5) +
  facet_grid(. ~ Survived) +
  labs(x = "Passenger Class", title = "Dot plot: Passenger survival by class, by sex, by age"
       , subtitle = "LHS: did not survive, RHS: survived")