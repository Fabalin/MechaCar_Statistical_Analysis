# Import the dplyr package
library(dplyr)

### Deliverable 1 ###
# Import and read mpg file as df
mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Linear Regression using all six variables. 
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_table)

# Determine p-value and r-sqrd value of the liner regression model. 
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_table)) 


### Deliverable 2 ###
# Import and read the suspension_coil.csv file as a table. 
suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Total Summary DF of coil's PSI column 
total_summary <- suspension_table %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI) ,SD = sd(PSI))

# Create a lot_summary DF of PSI column  
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI) ,SD = sd(PSI))


### Deliverable 3 ###
# Simple T test to determine lot PSI statistical difference from population mean of 1,500 lbs/in^2.
t.test(suspension_table$"PSI", mu=1500)

# Perform the same analysis on all 3 lots individually. 
# lot 1
t.test(subset(suspension_table,Manufacturing_Lot == "Lot1", PSI), mu=1500)

# lot 2
t.test(subset(suspension_table,Manufacturing_Lot == "Lot2", PSI), mu=1500)

# lot 3
t.test(subset(suspension_table,Manufacturing_Lot == "Lot3", PSI), mu=1500)

