head(municipalities$statcode)
head(quintile_income$region_code)

#did not work
library(dplyr)

map_data<-quintile_income%>%
  filter(year==2021)

municipalities_map<-municipalities%>%
  left_join(map_data,
            by=c("statcode"="region_code"))
#did not work

#DEBUGGING
head(municipalities$statcode)
head(map_data$region_code)

unique(substr(municipalities$statcode,1,4))
unique(substr(map_data$region_code,1,4))

sum(map_data$region_code %in% municipalities$statcode)
  #suspecting municipality codes contain trailing spaces in "map_data$region_code"
nchar(head(map_data$region_code))
nchar(head(municipalities$statcode))
  #shows 4 extra characters in every code from region_code VS. 6 character codes in "statcode"
    #checking what exactly extra characters are (suspect trailing spaces)
dput(head(map_data$region_code, 5))
  #confirmed trailing spaces
  
#CLEANING THE CODES FROM "REGION_CODE":
map_data<-map_data%>%
  mutate(region_code=trimws(region_code))
  #checking...
nchar(head(map_data$region_code))

#checking whether join key is fixed now (output should return ~350 instead of 0)
sum(map_data$region_code%in%municipalities$statcode)

#RE-RUNNING THE JOIN
municipalities_map<-municipalities%>%
  left_join(map_data,
            by=c("statcode"="region_code"))

summary(municipalities_map$affordability_ratio)

#MAKING THE SPATIAL VARIATION MAP
library(ggplot2)

ggplot(municipalities_map)+
  geom_sf(aes(fill=affordability_ratio))+
  labs(
    title = "Housing Affordability Across Dutch Municipalities (2021)",
    subtitle = "Affordability ratio by munipality",
    fill = "Affordability\nRatio",
    caption = "Source: CBS (2021)"
  )+
  theme_minimal()
  )

ggsave(
  "affordability_spatial_map_2021.png",
  width = 10,
  height = 8
)
