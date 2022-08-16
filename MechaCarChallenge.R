library(dplyr)

# Linear Regression MPG
CarMPGData <- read.csv(file = 'MechaCar_mpg.csv')
MPGModel <- lm(mpg ~ AWD + ground_clearance + vehicle_length + vehicle_weight + spoiler_angle, data = CarMPGData)
summary(MPGModel)

# Visualizations for Trip Analysis
SuspensionData <- read.csv(file = 'Suspension_Coil.csv')
PSI_summary <- SuspensionData %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
PSI_summary_by_lot <- SuspensionData %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

# t Tests
t.test(SuspensionData$PSI, mu = 1500)
Lot1 = filter(SuspensionData, Manufacturing_Lot == "Lot1")
Lot2 = filter(SuspensionData, Manufacturing_Lot == "Lot2")
Lot3 = filter(SuspensionData, Manufacturing_Lot == "Lot3")
t.test(Lot1$PSI, mu = 1500)
t.test(Lot2$PSI, mu = 1500)
t.test(Lot3$PSI, mu = 1500)
