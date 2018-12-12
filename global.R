##### LIBRARIES & DATA #####
library(shiny)
library(shinythemes)
library(shinydashboard)
library(ggplot2)
library(plotly)
library(networkD3)
library(lubridate)
library(markdown)
library(dplyr)

topic_dist = read.csv(file = "topic_distribution.csv")
samplespread = read.csv(file = "sample_network.csv")
sharecount = read.csv(file = "news_subset_data.CSV")
df_expansion = read.csv(file = "spread_of_info.csv")
df_speed = read.csv(file = "speed_of_info.csv")

