#' @title Plot AQI trend
#'
#' @description This function plot NO2 AQI trend since 2000
#' @param data a data.frame
#' @param city city name in US
#' @seealso
#' @ruturn
#' @examples

trend_aqi <- function (data=pollution_us, city) {
  table<-data %>%
    select ("State", "County", "City", "Date Local",ends_with("AQI")) %>%
    filter (City==city )
  
  yyyymm <- paste(format(as.POSIXlt(table$'Date Local'), format = "%y-%m"), "01", sep = "-")
  
  monthly_mean <- tapply (table$'NO2 AQI', yyyymm, mean)
  monthly_mean <- as.data.frame(monthly_mean[2:nrow(monthly_mean)])
  
  
  start_year <- as.numeric(paste0("20",substr(rownames(monthly_mean)[1], 1,2)))
  start_month <- as.numeric(substr(rownames(monthly_mean)[1], 4,5))
  
  monthly_mean <- ts(monthly_mean, start = c(start_year, start_month), frequency = 12)
  
  plot(monthly_mean, ylab = "NO2 AQI")
}