library(tidyverse)
library(dplyr)
library(tidyr)

Vehicles <- read.csv("Vehicles.csv")
ZipCodes <- read.csv("Zip_Codes.csv")

#only include zipcodes that fall under one company
unique_ZipCodes <- ZipCodes %>%
  filter(State == "MD") %>%
  group_by(Zip_Code, Company) %>%
  tally() %>%
  mutate(obs = 1) %>%
  group_by(Zip_Code) %>%
  summarize(obs = sum(obs)) %>%
  filter(obs == 1)

#find duplicate values
ZipCodes_df <- ZipCodes %>%
  filter(State == "MD") %>%
  group_by(Zip_Code, Company) %>%
  tally()

#final zipcode df only contains unique values, no duplicate rows
ZipCodes_df2 <- left_join(unique_ZipCodes, ZipCodes_df, by = "Zip_Code") %>%
  select(-c(obs, n))

unique_month <- unique(Vehicles$Year_Month)

#create a row for each zipcode and year/month
df<- crossing(ZipCodes_df2, unique_month) %>% rename(Year_Month = unique_month)

#combine electric and plug in hybrid values
Vehicles_df <- Vehicles %>%
  group_by(Year_Month, Zip_Code) %>%
  summarize(Count = sum(Count))

merged_data <- merge(df, Vehicles_df, by = c("Zip_Code", "Year_Month"), all.x = TRUE) %>%
  mutate(Count = ifelse(is.na(Count), 0, Count))

merged_data <- merged_data %>%
  mutate(Date = paste0(Year_Month, "/01")) %>%
  mutate(Date = as.Date(Date, format = "%Y/%m/%d"))

merged_data <- merged_data %>%
  group_by(Date, Company) %>%
  mutate(StationRebate = case_when(
    Company == "Southern Maryland Electric Cooperative Inc." ~ ifelse(Date >= as.Date("2021-03-01"), 1, 0),
    Company == "Potomac Electric Power Co" ~ ifelse(Date >= as.Date("2019-07-01"), 1, 0),
    Company == "Baltimore Gas & Electric Co" ~ ifelse(Date >= as.Date("2021-01-01"), 1, 0),
    Company == "The Potomac Edison Company" ~ ifelse(Date >= as.Date("2020-01-01"), 1, 0),
    Company == "Delmarva Power" ~ ifelse(Date >= as.Date("2019-07-01"), 1, 0)
  ))

write.csv(merged_data, "merged.csv")

temp <- merged_data %>%
  group_by(Zip_Code, Company) %>%
  summarize(mean = mean(Count))

Vehicles_Zipcodes <- unique(Vehicles$Zip_Code)
ZipCodes_zip <- unique(ZipCodes$Zip_Code)
