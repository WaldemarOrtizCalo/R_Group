#   Script Details                                                          ####

# Author: Waldemar Ortiz-Calo

# Date:2022-09-13 

# Purpose: 

###############################################################################
#   Library / Functions / Data                                              ####

#      Library                                                              ####
library(tidyverse)

#      Functions                                                            ####

#      Data                                                                 ####
df <- read_csv("1.Data/ggplot_9-13-22/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

###############################################################################
#   [Data Exploration]                                                      ####

# Summary Statistics 
summary(df)

###############################################################################
#   [scatter plots]                                                         ####

ggplot(data = df, aes(x = weight, y = hindfoot_length))+
  geom_point(alpha = .1, aes(color = genus)) +
  labs(x = "weight", y = "hindfoot length")+
  theme_bw()

###############################################################################
#   [BoxPlots]                                                              ####

ggplot(data = df, aes(x = species_id, y = weight))+
  geom_jitter(alpha = .1, color = "tomato")+
  geom_boxplot()

###############################################################################
#   [Violin Plot]                                                           ####
ggplot(data = df, aes(x = species_id, y = weight))+
  geom_jitter(alpha = .1, color = "tomato")+
  geom_violin()

###############################################################################
#   [Challenge]                                                             ####
sub <- df %>% filter(species_id == "NL" | species_id == "PF")

ggplot(data = sub, aes(x = species_id, y = hindfoot_length))+
  geom_jitter(aes(color = as.factor(plot_id)))+
  geom_boxplot()+
  labs(x = "Species ID", y = "Hindfoot Length")+
  theme_bw()
###############################################################################
#   [Time Series]                                                           ####

yearly_counts <- df %>% 
  count(year, species_id)

ggplot(yearly_counts, aes(x = year, y = n, group = species_id)) +
  geom_line(aes(color = species_id))+
  theme_bw()+
  labs(x = "Year", y = "Count")+
  facet_wrap(~species_id)

###############################################################################
#   [Plotly]                                                                ####

library(plotly)

plot1 <- ggplot(yearly_counts, aes(x = year, y = n, group = species_id)) +
  geom_line(aes(color = species_id))+
  theme_bw()+
  labs(x = "Year", y = "Count")

ggplotly(plot1)



