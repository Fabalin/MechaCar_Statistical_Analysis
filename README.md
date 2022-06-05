# MechaCar_Statistical_Analysis
Performing Statistical Analysis on Car Manufacturing using R. 

## Overview 
The data is sourced from two CSV files containing production data for MechaCar. The [MechaCar_mpg.csv](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/MechaCar_mpg.csv) file contains variables to perform linear regression to determine the MPG of its production models. The [Suspension_Coil.csv](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Suspension_Coil.csv) file contains the suspension data, described in PSI, of production lots. An RScript was made to help perform satistical analyses regarding the production data. The outputs are stored as PNG files in the folder names beginning with **Deliverable**. The challenge will focus on 4 deliverables: 

- Linear Regression to Predict MPG
- Summary Statistics for Multiple Suspension Coils across Production Lots
- T-Test on Suspension Coils 
- Study Design Comparing MechaCar's performance with Other Manufacturers

## Software
- R Studio - 2022.02.2+485
- R - 4.2.0

## Analysis and Results 
### Linear Regression to Predict MPG
Multiple linear regression was performed to account for all independent variables and their relation to MPG. The Linear function provides the Y-intercept and the correlation coefficient for each independent variable. These are displayed below: 

![Linear_Coefficients](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Deliverable_1/linearcoeff.PNG)

Additionally, statistical metrics of this multiple regression are displayed below to provide the statistical impact of each independent variable on the model based on the p_value:  

![Linear_Summary](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Deliverable_1/linearsum.PNG)

Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
The `Pr(>|t|)` output displays the p-value that denotes statistical significance. Among the independent variables that contribute to the linear model, there are two that provides the most significant impact with a p-value less than 0.05. *Note: The intercept also has a low p-value but it is not an independent variable. The low p-value suggests that when all other variables are zero, the intercept value holds more power over the variance of the linear model.* Therefore, the parameters and correlation coefficients listed below provide a non-random amount of variance to the mpg values in this mulitple linear regression model:

- Vehicle Length: 6.267
- Ground Clearance: 3.546

Vehicle Weight appears to contribute more to the model than the rest of the variables but it is not as significant as the Vehicle Length or Clearance. This is likely because the Vehicle Length impacts the weight whereas the ground clearance could be in part be attributed to the diameters of the wheels being used. 

The slope of this model is not considered zero since there are two variables with significant impacts on the model's predictive power. Moreover, the Pearson Correlation coefficent, calculated from the square root of the adjusted R-squared value provided in the summary statistics, is 0.83 suggesting a strong positive correlation between the independent variables as a whole and the MPG. 

This linear model's predictive power can be assessed through the R-squared value. Whether both the R-squared values provided are close to 0.7 which means that the model can accurately predict by explaining the variations 70% of the time. However, a more effective model would produce a higher R-squared value that can either meet or superced the industry standard.   

### Summary Statistics on Suspension Coils 
To assess the production challenges, the products manufactured must be compared to the design specifications. MechaCar suspension coil design specifications dictate that the variance of the suspension coils miust not exceed 100 lbs/in^2. Summary statistics for the suspension coils manufactured based on lots are displayed below. The first graphic depicts the summary PSI values across all lots while the second graphic depicts summary PSI values based on the lot of manufacture. 

![All_lots_PSI](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Deliverable_2/PSItotalsum.PNG)

![lot_summary](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Deliverable_2/PSIlotsum.PNG)

Although the total lots summary suggests that the variance in PSI technically abides by the design specifications, it is still relatively high at 62.3 lbs/in^2. To understand this value, a more granular approach is needed. The second graphic shows that almost all of the variation is attributed to Lot3. The variance for Lot1 and Lot2 are well below the threshold listed in the design specifications. Moreover, this major deviation from the specifications is being understated by the addition of specification compliant samples in Lots1-2. For this reason, Lot 3 is the only lot that does not meet the design specifications and most probably caused by insufficient quality control with the manufacturing process or equipment failure. 

### T-Test on Suspension Coils
To further support the notion that Lot3 is problematic and should be recalled, a simple t-test was performed comparing the lots to the population mean of suspension coils: 1,500 lbs/in^2. When the mean of all the lots are compared against the population mean, the resulting p-value > 0.05 implies that there is not enough evidence to suggest any differences between the sample and the mean:

![Ttest_alllots](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Deliverable_3/ttall.PNG)

The same conclusion is also true for Lots 1 and 2, with Lot 1 being virtually indistinguishable from the population mean: 

![Lot1](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Deliverable_3/tlot1.PNG)

![Lot2](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Deliverable_3/tlot2.PNG)

Lot 3 however, displays a p-value < 0.05 suggesting that there is statistical significance to the differences being observed between the lot's mean PSI value and the population's mean PSI values. This deviation from the mean can also be attributed to the aforementioned reasons outlined in the previous section: Summary Statistics on Suspension Coils: 

![Lot3](https://github.com/Fabalin/MechaCar_Statistical_Analysis/blob/main/Deliverable_3/tlot3.PNG)

### Study Design: MechaCar vs Competiton
To statistically quantify MechaCar Vehicles' performance against the competition, performance should be defined based on consumer habits and preferences. Inferring the consumer's interests based on the name MechaCar, the vehicles produced should be focused on power that is balanced by efficiency. Additionally, the cost of the vehicle is also a key contributing factor to consumer's buying habits. Quantification of some key categorical data such as Driving, comfort, interior, technology and utility should also be included as well as it pertains to customer satisfaction. Therefore, a satistical analysis should compare these metrics between MechaCar and its competition:

- Price (Numerical, Continuous)
- Horse Power (Numerical, Continuous)
- Fuel Efficiency (Numerical, Continuous)
- Driving (Categorical, Ordinal)
- Comfort (Categorical, Ordinal)
- Interior (Categorical, Ordinal)
- Technology (Categorical, Ordinal)
- Utility (Categorical, Ordinal)

The Numerical Data can be measured and calculated but the Categorical data should be collected from consumer surveys and ranked on a scale of 1-10. Regardless of the datatype and the statistic test peformed, the null hypothesis will be that the differences observed are not statistically significant and could be due to oversight in sampling or random chance. The Alternative hypothesis will suggest that the differences observed are statistically significant and that the conclusion drawn will depend on the mean values of the metric from each dichotomous sample: MechaCar vs Competition. The null and alternative hypotheses provide a statistical framework and integrity to support the conclusion that either MechaCar is better or worse in a given metric, when compared with the competition. If both MechaCar and its competitior are tied between equal amounts of metrics, a final conclusion of MechaCar's overall performance that accounts for all the metrics will depend on the consumer and their desires. 

Although a two sample t-test is sufficient to compare the two different samples across all makes and models, a more granular approach that delves into differences observed between each model, within each maker, would have to adopt an ANOVA based on the amount of samples available. Since all the metrics are indpenendent data types that are collected individually, A Two-Sample T-Test requires a dichotomous comparison of MechaCar Samples and Competitor Samples across each metric. An ANOVA would require more variables. In this case, it would be each metric across different models between the different makes of MechaCar and Competitor. 
