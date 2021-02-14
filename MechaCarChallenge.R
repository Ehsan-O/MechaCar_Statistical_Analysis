# Importing "dplyr" Package
library(dplyr)

# Reading MechaCar_mpg.csv file in to a data frame
MechaCar_mpg <- read.csv(file = "MechaCar_mpg.csv", check.names = F, stringsAsFactors = F)

# Generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, MechaCar_mpg)

# Generate summary statistics for linear regression
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, MechaCar_mpg))

# Reading Suspension_Coil.csv file in to a data frame
Suspension_Coil <- read.csv(file = "Suspension_Coil.csv", check.names = F, stringsAsFactors = F)

# Creating summary statistics for the whole dataset for suspension coil’s PSI 
total_summary <- Suspension_Coil %>%
  summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Creating summary statistics for each lot for suspension coil’s PSI 
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Performing t-test
# All lots
t.test(Suspension_Coil$PSI, mu = 1500)

# lot1
t.test(subset(Suspension_Coil, Suspension_Coil$Manufacturing_Lot=="Lot1")$PSI, mu = 1500)

# lot2
t.test(subset(Suspension_Coil, Suspension_Coil$Manufacturing_Lot=="Lot2")$PSI, mu = 1500)

# lot3
t.test(subset(Suspension_Coil, Suspension_Coil$Manufacturing_Lot=="Lot3")$PSI, mu = 1500)
