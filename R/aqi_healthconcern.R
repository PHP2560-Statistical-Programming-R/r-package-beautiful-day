#' @title Compare AQI category percentage by CBSA
#'
#' @description There are six categories of AQI. Each category corresponds to a different level of health concern. This function
#'     plots percentage of each category by CBSA. It can be used to compare AQI among different CBSAs.
#' @param data A data.frame. The default dataset is annual_aqi.
#' @param cbsa A vector of CBSA. You can input the CBSAs you want to compare.
#' @examples
#' aqi_healthconcern(annual_aqi,c("Aberdeen, SD","Adrian, MI"))
#' 
#' @export

aqi_healthconcern<-function(data=annual_aqi,cbsa){
  
  if (!("ggpubr" %in% installed.packages())){
    devtools::install_github("kassambara/ggpubr")
  }
  
    library(ggpubr) # This function needs ggpubr to combine multiple ggplots on the same page.
  
  healthconcern <- data%>%
    mutate(
      Good_Perc = as.numeric(data$'Good Days')/as.numeric(data$'Days with AQI'),
      Moderate_Perc = as.numeric(data$'Moderate Days')/as.numeric(data$'Days with AQI'),
      Unhealthy_For_Sensitive_Group_Perc = as.numeric(data$'Unhealthy for Sensitive Groups Days')/as.numeric(data$'Days with AQI'),
      Unhealthy_Perc = as.numeric(data$'Unhealthy Days')/as.numeric(data$'Days with AQI'),
      Very_Unhealthy_Perc = as.numeric(data$'Very Unhealthy Days')/as.numeric(data$'Days with AQI'),
      Hazardous_Perc = as.numeric(data$'Hazardous Days')/as.numeric(data$'Days with AQI')
           )%>%
    filter(CBSA %in% cbsa) # Calculate the percentage of each AQI category.
    
    Good <- ggplot(healthconcern,aes(x=Year, y=Good_Perc, color=CBSA))+
    geom_line()+
      labs(title = "Good",
           x="Year",
           y="Percentage")+
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
    
    Moderate <- ggplot(healthconcern,aes(x=Year, y=Moderate_Perc, color=CBSA))+
      geom_line()+
      labs(title = "Moderate",
           x="Year",
           y="Percentage")+
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
    
    Unhealthy_sen <- ggplot(healthconcern,aes(x=Year, y=Unhealthy_For_Sensitive_Group_Perc, color=CBSA))+
      geom_line()+
      labs(title = "Unhealthy for Sensitive Groups",
           x="Year",
           y="Percentage")+
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
    
    Unhealthy <- ggplot(healthconcern,aes(x=Year, y=Unhealthy_Perc, color=CBSA))+
      geom_line()+
      labs(title = "Unhealthy",
           x="Year",
           y="Percentage")+
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
    
    Very_Unhealthy <- ggplot(healthconcern,aes(x=Year, y=Very_Unhealthy_Perc, color=CBSA))+
      geom_line()+
      labs(title = "Very Unhealthy",
           x="Year",
           y="Percentage")+
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
    
    Hazardous <- ggplot(healthconcern,aes(x=Year, y=Hazardous_Perc, color=CBSA))+
      geom_line()+
      labs(title = "Hazardous",
           x="Year",
           y="Percentage")+
      theme_bw() +
      theme(plot.title = element_text(hjust = 0.5))
      
    
    ggpubr::ggarrange(Good, Moderate, Unhealthy_sen, Unhealthy, Very_Unhealthy, Hazardous, 
             ncol=2,nrow=3) # Combine multiple ggplots on the same page.
}