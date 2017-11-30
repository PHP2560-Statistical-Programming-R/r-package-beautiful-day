#The Air Quality Statistics Report displays air pollution values related to national standards for air quality.
conreport2017<-read.csv("conreport2017.csv")
devtools::use_data(conreport2017,overwrite = T)