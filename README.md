# ENVPH PACKAGE 
Authors: Annie Yang; Yiquan Xu

## THE IDEA OF OUR PACKAGE

Use our package to manipulate different kinds of environment and health data (air, climate/temperature, water, forest, waste). 

Extract useful information (statistic) from the raw data.

Visualize the environment data: horizontal comparison (among countries/states/cities) and vertical comparison (time series).

Health status classification.

## DATA AND INFORMATION RESOURCE

[OECD Data](https://data.oecd.org/environment.htm)

[EPA](https://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/download_files.html)

[Environmental Dataset Gateway](https://edg.epa.gov/metadata/catalog/main/home.page)

[Berkeleyearth](http://berkeleyearth.org/)

[Healthdata.gov](https://www.healthdata.gov/search/type/dataset)

## FUNCTIONS IN THE PACKAGE

### 1.INCLUDING DATASETS

Include example datasets in R package.

The datasets may include air, water, climate and health data.

### 2.MANIPULATION

Create functions to manipulate different kinds of pollution data.

Deal with missing value… to make the raw data in a good shape to work on.

The function can take the variable (country/state/city/CO/NO2) and slice the data into different interesting subset.

Take the raw data and return a data frame.

### 3.SUMMARY STATISTICS

Return the mean, standard deviation, max, min, range, skewness, kurtosis of interested variables.

Calculate covariance and correlation coefficient: If we want to know the correlation between different type of environment data, such as we want to get the correlation between the area of forest and the air pollution, the function can return covariance and correlation coefficient.

### 4.BOX PLOT

Draw the box plot. This function can take the city / state name, and mark the data of this city/state on the box plot and show the percentile.

### 5.VERTICAL COMPARISON - PLOT TRENDS OF DATA (TIME SERIES)

For example, we can calculate the average temperature in the state and plot the trend of the average temperature and the 95% confidence interval of the average temperature.

### 6.HORIZONTAL COMPARISON

Plot histogram mean (or other interested statistic) of pollutants and do the comparison between countries/state/city.

### 7.HEALTH STATUS CLASSIFICATION - PEOPLE CAN USE THIS FUNCTION TO GET A SENSE OF THEIR HEALTH STATUS.

•	Search the criteria to classify the level of pollution such as “polluted”, “mildly polluted” and “not polluted”.

•	Classify the cities into “polluted”, “mildly polluted” and “not polluted”.

•	Below we use environment status to measure the environment condition of the city/state/country… And health status measures the health conditions.

•	Set the initial environment status value at 0. If an environmental factor (water, air, soil…) is classified as “polluted”, minus 1. Else if it is classified as “mildly polluted”, do not change the value. Else plus 1. Return the final value. 

•	Set the initial health status value at the final value of environment status (here we suppose that the bad environment condition has negative effect on the health status). Except for environmental factors, health status is determined by many other factors, such as smoking, exercising and food. If the factors reflect the good health condition, add 1 to health status. Else minus 1. Set standard to classify people as “healthy”, “sub healthy” and “not healthy”. And output the final value of health status.

•	Note: We may set more categories according to the real situation.

## TEAM WORK

Annie Yang: data visualization - function 4, 5, 6

Yiquan Xu: statistical computation and classification - function 3, 7 

Annie Yang and Yiquan Xu: Data collection and manipulation - function 1,2


