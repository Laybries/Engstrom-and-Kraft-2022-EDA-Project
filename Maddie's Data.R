library(rinat)
library(tidyverse)

Oceanic_Ray <- get_inat_obs(query = "Oceanic Manta Ray",maxresults = 1000) %>% 
  select(scientific_name, time_observed_at, latitude, longitude) %>% 
  filter(scientific_name == "Mobula birostris",time_observed_at != "") %>% 
  mutate(
    year = substr(time_observed_at,0,4),
    month = substr(time_observed_at,6,7),
    day = substr(time_observed_at,9,10)) %>% 
  print()

Reef_Ray <- get_inat_obs(query = "Reef Manta Ray",maxresults = 1000) %>% 
  select(scientific_name, time_observed_at, latitude, longitude) %>% 
  filter(scientific_name == "Mobula alfredi",time_observed_at != "") %>% 
  mutate(
    year = substr(time_observed_at,0,4),
    month = substr(time_observed_at,6,7),
    day = substr(time_observed_at,9,10),
    season = (indx[as.character(month)]))%>% 
  print()

Combined_Table <- rbind(Oceanic_Ray,Reef_Ray) %>% 
  select(scientific_name, latitude, longitude, year, month,day) %>% 
  print()

world <- map_data("world")

ggplot() +
  geom_map(
    data = world, map = world,
    aes(long, lat, map_id = region)
  ) +
  geom_point(data = Reef_Ray,
    mapping = aes(x = longitude, y = latitude,
      color = season,
      size = ".01",
      alpha = .01))

indx <- setNames( rep(c('winter', 'spring', 'summer',
                        'fall'),each=3), c("12","01","02","03","04","05","06","07","08","09","10","11"))
