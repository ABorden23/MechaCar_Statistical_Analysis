library(dplyr)

# Deliverable 1 Linear Regression to Predict MPG #

# import csv
# demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)

MechaCar_mpg <- read.csv(file='./data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), and add the dataframe you created in Step 4 as the data parameter.
# lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model
Mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)
Mecha_lm

#View Summary Data
summary(Mecha_lm)

#View the RSquared Data
summary(Mecha_lm)$r.squared

# Deliverable 2 Summary Statistics on Suspension Coils #

# import csv

Suspension_Coil <- read.csv(file='./data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
Suspension_Coil

#Create Summary Table for Suspension Coil
total_summary <- Suspension_Coil %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),Std_Dev=sd(PSI))
total_summary

#View by Lots using Group_by
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),Std_Dev=sd(PSI))
lot_summary

#Deliverable 3  T-Test on Suspension Coils #
# Ho: mu= 1500
# Ha: mu <> 1500
t.test(Suspension_Coil$PSI, mu=1500)

#analyis - p-value (.06 greater than .05 therefore we fail to reject Ho)

#t-tests by lot

#Lot 1
t.test(subset(Suspension_Coil, Manufacturing_Lot =="Lot1")$PSI, mu=1500)
#Lot 2
t.test(subset(Suspension_Coil, Manufacturing_Lot =="Lot2")$PSI, mu=1500)
#Lot 3
t.test(subset(Suspension_Coil, Manufacturing_Lot =="Lot3")$PSI, mu=1500)
