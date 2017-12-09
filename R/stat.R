#' @title Calculate summary statistics for AQI
#'
#' @description This function helps you calculate summary statistics for AQI by CBSA.
#' @param data A data.frame
#' @param cbsa CBSA in US
#' @seealso
#' @ruturn
#' @examples
#' 
#' @export



stat_func<-function(data=annual_aqi,cbsa){
  names(data)[13] <- "MedianAQI"
  
  data_stat<-data%>%
    filter(CBSA==cbsa)%>%
    summarise(avg=mean(MedianAQI),s_d=sd(MedianAQI),
              Max=max(MedianAQI),Min=min(MedianAQI),
              Range=max(MedianAQI)-min(MedianAQI))
  
  return(data_stat)
}