#' @title Check your health status
#'
#' @description This function helps you to evaluate your health status
#' @param data Dataset to use for analysing health status.
#' @param cbsa A CBSA in US.
#' @param year A numeric. Year in which you want to analyze the air quality.
#' @param smoke Whether people smoke or not, equal to -1 if you smoke, else is 1. Default is 1.
#' @param exercise Whether people has certain exercise every day, equal to -1 if you don't, else is 1. Default is 1.
#' @param gene Whether people has certain gene may cause disease happen,equal to -1 for bad gene or 1 for good gene. Default is 1.
#' @return Return which kind of health status you are in. Healthy, sub healthy or unhealthy?
#' @author Yiquan Xu
#' @examples 
#' health_status(cbsa = "Ames, IA", year = 2008)
#'
#' @export


health_status<-function(data=annual_aqi, cbsa, year, smoke=1, exercise=1, gene=1){
  env_status=0 #set initial value to 0
  
  health_data <- data %>%
    filter(CBSA %in% cbsa & Year %in% year)
  
  names(health_data)[13] <- "MedianAQI"
  
  if(mean(health_data$MedianAQI)>=0&mean(health_data$MedianAQI)<=50){ # if conditions are set according to AQI levels
                                                                      # of health concern
    env_status = env_status + 2 # AQI level is Good
    
  } else if(mean(health_data$MedianAQI)>50&mean(health_data$MedianAQI)<=100){
    env_status = env_status + 1 # AQI level is Moderate
    
  } else if(mean(health_data$MedianAQI)>100&mean(health_data$MedianAQI)<=150){
    env_status = env_status # AQI level is UnhealthyForSensitiveGroup
    
  } else if(mean(health_data$MedianAQI)>150&mean(health_data$MedianAQI)<=200){
    env_status = env_status - 1 # AQI level is Unhealthy
    
  } else if(mean(health_data$MedianAQI)>200&mean(health_data$MedianAQI)<=300){
    env_status = env_status - 2 # AQI level is VeryUnhealthy
    
  } else{
    env_status = env_status - 3 # AQI level is Hazardous
  }
  
  status = env_status + smoke + exercise + gene # Calculate the score for health status
  
  if(status>=3&status<=6){
    
    print('Healthy!Keep going!:)')
    
  } else if(status>=-2&status<=2){
    
    print('Sub Healthy.Maybe you can do more to improve!;)')
  } else{
    
    print('Not healthy.:( You should be careful of your health!')
  }
}
