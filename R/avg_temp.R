#' @title Average Monthly Temperatures Trend
#'
#' @description This function helps you plot average monthly temperatures during a specified time period. You can also use it to do
#'     comparison between countries.
#' @param data A data.frame. Use GlobalTemperatures or GlobalLandTemperaturesByCountry dataset to do analysis.
#' @param year A vector. Time period during which you want to analyse how the temperature changed.
#' @param month A vector. Time period during which you want to analyse how the temperature changed.
#' @param country A vector of countries' name. Compare how the temperature changed in these countries during a specified time period.
#' @param con Display confidence interval around smooth? (FALSE by default)
#' @examples
#' avg_temp(data=GlobalLandTemperaturesByCountry,
#' year=c(2000:2015), month=c(1:12), 
#' country = c("Afghanistan","Andorra"),con="F")

# Load GlobalTemperatures or GlobalLandTemperaturesByCountry dataset before using this function

avg_temp <- function(data,year,month,country,con = "FALSE"){
  
if(missing(country)){ # when data=GlobalTemperatures, the country argument is missing
  glb_avg_temp <- data %>% 
    mutate(Month=as.numeric(format(data$dt,"%m")),
           Month.String=format(data$dt,"%B"), # Create string month
           Year=as.numeric(format(data$dt,"%Y")))%>% # Create new columns month and year
    select(dt, Month, Month.String, Year, LandAverageTemperature, LandAverageTemperatureUncertainty)%>%
    na.omit() %>% # Remove missing values
    filter(Year %in% year & Month %in% month)
  
  glb_avg_temp%>%
    ggplot(aes(x=dt, y=LandAverageTemperature,colour=reorder(Month.String,-LandAverageTemperature,mean)))+
    # Sort month from highest temperature to lowest temperature
    geom_smooth(method="loess",se=con)+
    labs(title="Global Average Temperatures",
         x="Year",
         y="Average Temperature",
         colour="Month")
} else {
  glb_avg_temp <- data %>% 
    mutate(Month=as.numeric(format(data$dt,"%m")),
           Month.String=format(data$dt,"%B"),
           Year=as.numeric(format(data$dt,"%Y")))%>% # Create new columns month and year
    select(dt, Month, Month.String, Year, Country, AverageTemperature, AverageTemperatureUncertainty)%>%
    na.omit() %>% # Remove missing values
    filter(Year %in% year & Month %in% month & Country %in% country)
  
  glb_avg_temp%>%
    ggplot(aes(x=dt, y=AverageTemperature,colour=reorder(Month.String,-AverageTemperature,mean)))+
    geom_smooth(method="loess",se=con)+
    facet_wrap(~Country,scales="free")+
    labs(title="Average Temperatures",
         x="Year",
         y="Average Temperature",
         colour="Month")
  }
}