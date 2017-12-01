#' @title Extract data from pollution_us
#'
#' @description This function help you extract data based on state, date and pollutant.
#' @param data a data.frame
#' @param cbsa cbsa in US
#' @seealso
#' @ruturn
#' @examples



stat_func<-function(data=annual_aqi_by_cbsa,cbsa){
  names(data)[13] <- "MedianAQI"
  data_stat<-data%>%
    filter(CBSA==cbsa)%>%
    summarise(avg=mean(MedianAQI),s_d=sd(MedianAQI),
              Max=max(MedianAQI),Min=min(MedianAQI),
              Range=max(MedianAQI)-min(MedianAQI))
  return(data_stat)
}