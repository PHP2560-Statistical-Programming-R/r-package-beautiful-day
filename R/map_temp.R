#' @title Plot temperature geographic maps for States in USA
#'
#' @description This function plots temperature geographic maps for States in USA in specific year
#' @param data A data.frame. The defalt dataset is GlobalLandTemperaturesByState.
#' @param year numeric
#' @examples
#' temp_state(year=2012)
#' 
#' @export

# Loading Packages
# library(choroplethr)
# library(choroplethrMaps)
# library(plotly)
# library(countrycode)

temp_state<-function(data=GlobalLandTemperaturesByState,year){
  
map <- data %>%
  mutate(Month=as.numeric(format(data$dt,"%m")), # Create new column month (decimal number)
         Month.String=format(data$dt,"%B"), # Create string month (full name)
         Year=as.numeric(format(data$dt,"%Y"))) %>% # Create new column year (4 digit)
  na.omit() %>% filter(Country=="United States")

map$State <- as.character(map$State)  
map$State[map$State=="Georgia (State)"] <- "Georgia" # Changing Georgia (State)
map$State<- as.factor(map$State)                    

#' select columns of interest
map_select <- map %>% 
  select(Year,AverageTemperature,State) %>%
  group_by(Year, State) %>%
  summarise(value=mean(AverageTemperature))

#Data frame must have a column named region (all lower case) and another one value.
colnames(map_select)[2]<- "region"
map_select$region<-tolower(map_select$region)

map_state<-map_select %>%
  filter(Year==year)

map_state<-map_state[,2:3]

print(state_choropleth(map_state,
                       title = paste("Land Temperature",year," "), 
                       num_colors = 8,
                       legend = "Degrees"),reference_map=TRUE)
}

#' @title Plot temperature geographic maps for countries
#'
#' @description This function plots temperature geographic maps for countries in specific year
#' @param data A data.frame. The defalt dataset is GlobalLandTemperaturesByCountry.
#' @param year numeric
#' @examples
#' temp_country(year=2012)

temp_country<-function(data=GlobalLandTemperaturesByCountry, year){
  # light grey boundaries
  l <- list(color = toRGB("grey"), width = 0.5)
  
  # specify map projection/options
  g <- list(
    showframe = FALSE,
    showcoastlines = FALSE,
    projection = list(type = 'Mercator')
  )
  
  map_country <- data %>%
    mutate(Month=as.numeric(format(data$dt,"%m")), # Create new column month (decimal number)
           Month.String=format(data$dt,"%B"), # Create string month (full name)
           Year=as.numeric(format(data$dt,"%Y"))) %>% # Create new column year (4 digit)
    na.omit()%>%
    select(Year,AverageTemperature,Country) %>%
    group_by(Year, Country) %>%
    summarise(AvgTemp=mean(AverageTemperature))
  
  code<-countrycode(map_country$Country,'country.name', 'iso3c')
  
  map_country$CODE<-code
  
  temp<-map_country%>%filter(Year==year)
  
  map_temp <- plot_geo(temp) %>%
    add_trace(
      z = ~AvgTemp, color = ~AvgTemp, colors = 'Blues',
      text = ~Country, locations = ~CODE, marker = list(line = l)
    ) %>%
    colorbar(title = 'Temperature') %>%
    layout(
      title = paste(year,"Temperature Map",sep=" "),
      geo = g
    )
  
  map_temp
}
