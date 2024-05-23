install.packages("tidyverse")
library("tidyverse")

Vehicles <- read.csv("Vehicles.csv")
ZipCodes <- read.csv("Zip_Codes.csv")

df1 <- merge(Vehicles, ZipCodes, by = "Zip_Code") %>%
  filter(State == "MD") %>%
  mutate(Year_Month = ifelse(is.na(Year_Month), 0, Year_Month)) %>%
  mutate(Zip_Code = ifelse(is.na(Zip_Code), 0, Zip_Code)) %>%
  mutate(Count = ifelse(is.na(Count), 0, Count))

smeco <- df1 %>%
  filter(Company == "Southern Maryland Electric Cooperative Inc.") %>%
  mutate(date = paste0(Year_Month, "/01")) %>%
  mutate(date = as.Date(date, format = "%Y/%m/%d")) %>%
  group_by(date) %>%
  summarize(TotalEVs = sum(Count)) %>%
  mutate(StationRebate = ifelse(date > as.Date("2021-03-01"), 1, 0)) %>%
  mutate(TouRebate = ifelse(date > as.Date("2023-10-01"), 1, 0))
  ggplot(smeco, aes(x = date, y = TotalEVs)) + geom_line() +
  geom_vline(xintercept = as.Date("2021-03-01"), colour = "red", 
             linetype = "longdash") +
  geom_vline(xintercept = as.Date("2023-10-01"), colour = "blue", 
             linetype = "longdash") + 
  ggtitle("SMECO")

pepco <- df1 %>%
  filter(Company == "Potomac Electric Power Co")%>%
  mutate(date = paste0(Year_Month, "/01")) %>%
  mutate(date = as.Date(date, format = "%Y/%m/%d")) %>%
  group_by(date) %>%
  summarize(TotalEVs = sum(Count)) %>%
  mutate(StationRebate = ifelse(date > as.Date("2019-07-01"), 1, 0)) %>%
  mutate(TouRebate = ifelse(date > as.Date("2022-11-01"), 1, 0))
  ggplot(pepco, aes(x = date, y = TotalEVs)) + geom_line() +
  geom_vline(xintercept = as.Date("2020-07-01"), colour = "red", 
             linetype = "longdash") +
  geom_vline(xintercept = as.Date("2022-11-01"), colour = "blue", 
             linetype = "longdash") + 
  ggtitle("Pepco")
  
  
bge <- df1 %>%
  filter(Company == "Baltimore Gas & Electric Co") %>%
  mutate(date = paste0(Year_Month, "/01")) %>%
  mutate(date = as.Date(date, format = "%Y/%m/%d")) %>%
  group_by(date) %>%
  summarize(TotalEVs = sum(Count)) %>%
  mutate(StationRebate = ifelse(date > as.Date("2021-01-01"), 1, 0)) %>%
  mutate(TouRebate = ifelse(date > as.Date("2021-01-01"), 1, 0))
  ggplot(bge, aes(x = date, y = TotalEVs)) + geom_line() +
  geom_vline(xintercept = as.Date("2020-12-25"), colour = "red", 
             linetype = "longdash") +
  geom_vline(xintercept = as.Date("2021-01-01"), colour = "blue", 
             linetype = "longdash") + 
  ggtitle("Baltimore Gas and Electric")
  
potomac <- df1 %>%
  filter(Company == "The Potomac Edison Company") %>%
  mutate(date = paste0(Year_Month, "/01")) %>%
  mutate(date = as.Date(date, format = "%Y/%m/%d")) %>%
  group_by(date) %>%
  summarize(TotalEVs = sum(Count)) %>%
  mutate(StationRebate = ifelse(date > as.Date("2020-01-01"), 1, 0)) %>%
  mutate(TouRebate = ifelse(date > as.Date("2023-05-15"), 1, 0))
  ggplot(potomac, aes(x = date, y = TotalEVs)) + geom_line() +
  geom_vline(xintercept = as.Date("2020-07-01"), colour = "red", 
             linetype = "longdash") +
  geom_vline(xintercept = as.Date("2023-05-15"), colour = "blue", 
             linetype = "longdash") + 
  ggtitle("Potomac")

delmarva <- df1 %>%
  filter(Company == "Delmarva Power") %>%
  mutate(date = paste0(Year_Month, "/01")) %>%
  mutate(date = as.Date(date, format = "%Y/%m/%d")) %>%
  group_by(date) %>%
  summarize(TotalEVs = sum(Count)) %>%
  mutate(StationRebate = ifelse(date > as.Date("2019-07-01"), 1, 0)) %>%
  mutate(TouRebate = ifelse(date > as.Date("2019-07-01"), 1, 0))
  ggplot(delmarva, aes(x = date, y = TotalEVs)) + geom_line() + 
  geom_vline(xintercept = as.Date("2020-07-01"), colour = "red", 
             linetype = "longdash") +
  geom_vline(xintercept = as.Date("2020-06-25"), colour = "blue", 
             linetype = "longdash") + 
  ggtitle("Delmarva")
  