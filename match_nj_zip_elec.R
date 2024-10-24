library("tidyverse")
library("terra")

zip<-vect("cb_2019_us_zcta510_500k/cb_2019_us_zcta510_500k.shp")
zipdf<-as.data.frame(zip)

elec<-vect("new-jersey-electric-utilities-territory-map.shp")
elec_proj<-project(elec, crs(zip))

int<-intersect(zip, elec_proj)
intdf<-as.data.frame(int)

intdf$area<-expanse(int, unit="m")

intdf2<-intdf |>
  group_by(ZCTA5CE10) |>
  mutate(maxarea=max(area)) |>
  filter(area==maxarea) |>
  rename(zipcode=ZCTA5CE10) |>
  select(zipcode, DISTRICT, PARENT, LABEL, NAME)

write.csv(intdf2, "nj_zip_elec.csv", row.names=F)

table(intdf2$NAME)
