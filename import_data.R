# Our functions are based on the following datasets.

# load the rda file and import the air pollution data in US

# The pollution_us dataset contains four major pollutants (Nitrogen Dioxide, Sulphur Dioxide, Carbon Monoxide and Ozone) for every day from 2000-2016.

load(file = "data/pollution_us.rda")

# load the annual AQI data from 2000 to 2017 by Core Based Statistical Area (CBSA)

load(file = "data/annual_aqi.rda")