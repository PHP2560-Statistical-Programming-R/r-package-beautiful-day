#' @title Make the boxplot of AQI
#'
#' @description This function helps you make boxplots of AQI in the year you are interested. And also mark the point of the CBSA you are interested.
#'     So that you can know the AQI of the CBSA is relatively high or low compared to other geographic areas.
#' @param data A data.frame. The default dataset is annual_aqi.
#' @param start Start year
#' @param end End year
#' @param cbsa A CBSA in US.
#' @examples
#' boxplot_aqi(annual_aqi,"2000","2005","Albany, GA")



boxplot_aqi<-function(data=annual_aqi,start,end, cbsa){
  
names(data)[13] <- "MedianAQI"

interested_cbsa<-data%>%filter(CBSA==cbsa & Year>=start & Year<=end)

box_data<-data%>%filter(Year>=start & Year<=end)

ggplot(box_data,aes(x=as.factor(Year), y=MedianAQI, fill=Year))+
  geom_boxplot(alpha=0.3)+
  geom_point(data=interested_cbsa,
             aes(x=as.factor(Year), y=MedianAQI),
             color="red", size=1)+
  labs(x= "Year")
}