# Load the libraries
library(tidyverse)
library(ggplot2)
library(dplyr)
library(scales)
library(hrbrthemes)


# Read csv file 
data <- read.csv("~/desktop/Final/R/data.csv") #gdp
head(data)

medals <- read.csv("~/desktop/Final/R/Medals.csv") #Medals
head(medals)

# Check empty column 
colSums(is.na(medals) | medals == "")
colSums(is.na(data) | data == "")

# Clean data
medals[medals==0] <- NA #Set zero to NA
medals<-medals[complete.cases(medals),] # Delete rows associated with NA
head(medals)

data[data==0] <- NA #Set zero to NA
data<-data[complete.cases(data),] # Delete rows associated with NA
head(data)

# Total Number of models won by Top 10 Countries
ggplot(medals, 
       aes(x = Team,
           y = factor(Total, labels = c("10","20","30","40","50","60","70","80","90","100")))) +
  geom_bar(stat = "identity", fill = "#3e4a5c", color="black")+ 
  labs(title = "Total Number of models won by Top 10 Countries" , x = "Country",   y = "Medals")+
  theme(plot.title = element_text(hjust = 0.5))


# Gather medal type column into one variable
medals_ <- medals%>% gather(medal, count, Gold:Bronze)
head(medals) 

# Medal type vs Country
ggplot(medals_, aes(fill=medal, y=count, x=Team)) + 
  geom_bar(position="dodge", stat="identity")+
  labs(title = " Medal type vs Country", x = "Country",   y = "Count")+
  theme(plot.title = element_text(hjust = 0.5))

# Bar chart for Just Gold medals
ggplot(medals, aes(x=Team, y=Gold)) + 
  geom_bar(stat = "identity",color="#ded159", fill="#ded159") +
  coord_flip()+
  labs(title = "Total Number of Gold medals won by Top 10 Countries")+
  theme(plot.title = element_text(hjust = 0.5))

# Bar chart for Just Silver medals
ggplot(medals, aes(x=Team, y=Silver)) + 
  geom_bar(stat = "identity",color="#a6a38a", fill="#a6a38a") +
  coord_flip()+
  labs(title = "Total Number of Silver medals won by Top 10 Countries")+
  theme(plot.title = element_text(hjust = 0.5))

# Bar chart for Just Bronze medals
ggplot(medals, aes(x=Team, y=Bronze)) + 
  geom_bar(stat = "identity",color="#cd7f32", fill="#cd7f32") +
  coord_flip()+
  labs(title = "Total Number of Bronze medals won by Top 10 Countries")+
  theme(plot.title = element_text(hjust = 0.5))


#Total no. of medals VS World GDP
ggplot(data, aes(x=World_GDP., y=Total, size = Population., color=Country)) +
  geom_point(alpha=0.7)+ 
  labs(title = "Total no. of medals VS World GDP", x = "World_GDP",   y = "Medals")+
  theme(plot.title = element_text(hjust = 0.5))
