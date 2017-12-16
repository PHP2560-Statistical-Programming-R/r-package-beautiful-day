#' @title Check and plot air quality by state
#'
#' @description This function gets the data from CDC, the outcome is a combination outcome of
#'     monitoring ozone and PM2.5.
#' @param data Dataset to use for map. The default dataset is AirQuality_Tracking.
#' @param year A numeric. The report year of the air quality data.
#' @examples
#' checkAirQuality(year=2010)
#'
#' @export

checkAirQuality <- function(data = AirQuality_Tracking, year){
  map <- data%>%
    filter(Value<=1000 & Unit != "%" & ReportYear == year)%>%
    dplyr::group_by(StateName)%>%
    dplyr::summarise(AirQuality = mean(Value))
  code <- state.abb[match((map$StateName),state.name)] #convert long state name to abbreviation
  code <- as.factor(code)
  map$CODE <- code
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  map_state <- plot_geo(map, locationmode = 'USA-states') %>%
    add_trace(
      z = ~AirQuality, text = ~StateName, locations = ~code,
      color = ~AirQuality, colors = 'Purples'
    ) %>%
    colorbar(title = "AirQuality") %>%
    layout(
      title = paste("AirQuality","of","year",year),
      geo = g)
  print(map_state)
}

