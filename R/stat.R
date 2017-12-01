#' @title Gather statistical data from annual_aqi_by_cbsa
#'
#' @description This function helps you get the statistical data from annual_aqi_by_cbsa
#' @param data a data.frame
#' @param cbsa cbsa in US
#' @seealso
#' @ruturn
#' @examples



stat_func<-function(data=annual_aqi,cbsa){
  names(data)[13] <- "MedianAQI"
  
  data_stat<-data%>%
    filter(CBSA==cbsa)%>%
    summarise(avg=mean(MedianAQI),s_d=sd(MedianAQI),
              Max=max(MedianAQI),Min=min(MedianAQI),
              Range=max(MedianAQI)-min(MedianAQI))
  
  return(data_stat)
}