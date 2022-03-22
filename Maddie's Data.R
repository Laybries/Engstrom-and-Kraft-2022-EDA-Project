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

ggplot(data = Oceanic_Ray, mapping = aes(latitude,longitude))