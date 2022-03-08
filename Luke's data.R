library(tidyverse)
library(remotes)
install_github("pjhanly/iNatTools")
library(iNatTools)
library(rinat)

reef_ray <- get_inat_obs(query = "reef manta ray", maxresults = 1000)

rr <- select(reef_ray, scientific_name, datetime, latitude, longitude) %>%
  print()

