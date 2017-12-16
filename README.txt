# ENVPH PACKAGE 

Authors: Annie Yang; Yiquan Xu

## THE IDEA OF OUR PACKAGE

Use our package to tidy environment and health data (air, climate/temperature, water, forest, waste).
The default dataset in our package are about global temperature, annual AQI and AQI by pollutant.

Extract useful information (statistic) from the raw data. 

Visualize the environment data: horizontal comparison (among countries/states/cities) and vertical comparison (time series). Making AQI and Temperature Map.

Consider environment factors and evaluate your health status.

## DATA AND INFORMATION RESOURCE

[OECD Data](https://data.oecd.org/environment.htm)

[EPA](https://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/download_files.html)

[Environmental Dataset Gateway](https://edg.epa.gov/metadata/catalog/main/home.page)

[Berkeleyearth](http://berkeleyearth.org/)

[Healthdata.gov](https://www.healthdata.gov/search/type/dataset)

## GLOSSARY

[AQI](https://en.wikipedia.org/wiki/Air_quality_index): An air quality index (AQI) is a number used by government agencies to communicate to the public how polluted the air currently is or how polluted it is forecast to become. 

[AQI levels of Health concern](https://cfpub.epa.gov/airnow/index.cfm?action=aqibasics.aqi)

[CBSA](https://en.wikipedia.org/wiki/Core-based_statistical_area): Core-based statistical area

## FUNCTIONS IN THE PACKAGE

### 1. INCLUDING DATASETS

Include example datasets in R package: annual_aqi, GlobalTemperatures, GlobalLandTemperaturesByCountry,
GlobalLandTemperaturesByState, pollution_us, AirQuality_Tracking.

### 2. MANIPULATION

Function: tidy_data

The function can be used to tidy environment data and make the clean dataset more convenient to be used for analysis and visualization. The function can deal with missing value to make the raw data in a good shape to work on.

### 3. SUMMARY STATISTICS

Function: stat_func

Return a data frame containing statistic information about the Min, first quartile, Median, Mean, third quartile, Max, 95% Confidence interval.

### 4. BOX PLOT

Function: boxplot_aqi

Draw the box plot. This function can take the CBSA name, and mark the data of this area on the box plot.

### 5. VERTICAL COMPARISON - PLOT TRENDS OF DATA (TIME SERIES)

Function: avg_temp

The function can calculate the average global temperature (also temperature by country) in the state and plot the trend of the average temperature and the 95% confidence interval of the average temperature.

Function: aqi_healthconcern

The function can plot the trend of each AQI level of health concern.

Function: trend_aqi

The function plot time series graph by pollutant (NO2, O3, SO2, CO). 

### 6. HORIZONTAL COMPARISON

Function: avg_temp

You can use this function to compare temperature trend in different countries.

Function: aqi_healthconcern

You can use this function to compare AQI levels trend by CBSA.

Function: trend_aqi

You can choose a city to analyze the pollutant trend.

### 7. Map

•	AQI MAP: Function - checkAirQuality

•	Temperature Map: Functions - temp_country; temp_state
  
  Show temperature map in specific year or temperature change during a specific time period.

### 8. HEALTH STATUS EVALUATION

Function: health_status

•	Use AQI levels of health concern to measure the effect of AQI on health.

•	Set the initial health status value at 0. 

•	Take into account the AQI, smoke, exercise and gene to measure the health status.

•	Return which kind of health status you are in. Healthy, sub healthy or unhealthy?

## TEAM WORK

Annie Yang: Functions

            Tidy data - tidy_data

            Box plot - boxplot_aqi
            
            Vertical and Horizontal comparison - avg_temp; aqi_healthconcern; trend_aqi
            
            Temperature map - temp_country; temp_state

Yiquan Xu: Functions

           Summary statistics - stat_func

           AQI map - checkAirQuality
           
           Health status evaluation - health_status

Annie Yang and Yiquan Xu: Collect and import dataset into our package


