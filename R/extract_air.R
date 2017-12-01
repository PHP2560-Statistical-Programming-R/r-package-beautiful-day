#' @title Extract data from pollution_us
#'
#' @description This function help you extract data based on state, date and pollutant.
#' @param data a data.frame
#' @param state state name in US
#' @param start start date
#' @param end end date
#' @param pollutant type of pollutant (e.g. NO2, O3, SO2, CO)
#' @seealso
#' @ruturn
#' @examples

airquality<-function(data=pollution_us, state, start, end, pollutant) {
  data$'Date Local'<-as.Date(data$'Date Local') 
  # convert from character to "Date" representing calendar dates
  
  extract<-data%>%
    select("X1", "State Code", "County Code", "Site Num", "Address", "State", "County", "City", "Date Local",starts_with(pollutant))%>%
    filter(State==state & 'Date Local'>=start & 'Date Local'<=end)
  
  return(extract)
  }
