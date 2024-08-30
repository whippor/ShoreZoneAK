#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                                                                                ##
# ShoreZone Data QAQC                                                            ##
# Data source: ShoreZone                                                         ##
# R code prepared by Ross Whippo                                                 ##
# Last updated 2024-08-09                                                        ##
#                                                                                ##
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# SUMMARY:
# Combine multiple csvs into from inner and outer Kachemak Bay into a single file.

# Required Files (check that script is loading latest version):
# InnerBay.csv
# OuterBay.csv
# PortGraham.csv

# Associated Scripts:
# FILE.R

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# TABLE OF CONTENTS                                                            ####
#                                                                                 +
# RECENT CHANGES TO SCRIPT                                                        +
# LOAD PACKAGES                                                                   +
# READ IN AND PREPARE DATA                                                        +
# JOIN DATA SETS                                                                  +
# EXPORT CSV                                                                      +
#                                                                                 +
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# RECENT CHANGES TO SCRIPT                                                     ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2024/08-09 Script created

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# LOAD PACKAGES & PREPARE WORKSPACE                                            ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# clear any existing data in the environment
rm(list = ls())

library(tidyverse) # tidyverse is a collection of packages for data manipulation

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# READ IN AND PREPARE DATA                                                     ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# command to read in data to R
inner <- read_csv("data/InnerBay.csv", skip = 4)
outer <- read_csv("data/OuterBay.csv", skip = 4)
PG <- read_csv("data/PortGraham.csv", skip = 4)

# look at summary of data structure
str(inner)
str(outer)
str(PG)

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# JOIN DATA SETS                                                               ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

all_data <- inner %>%
  bind_rows(outer, PG) %>%
  distinct()

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# EXPORT CSV                                                                   ####
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

write_csv(all_data, "data/All_KBay_QAQC.csv")


####
#<<<<<<<<<<<<<<<<<<<<<<<<<<END OF SCRIPT>>>>>>>>>>>>>>>>>>>>>>>>#

# SCRATCH PAD ####

