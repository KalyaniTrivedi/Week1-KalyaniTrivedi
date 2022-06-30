library("haven")
# Loading the data
nfhs <- read_dta("data/IAHR52FL.dta")
# Total number of households
library(tidyverse)
household_count <- nrow(unique(select(nfhs, "hv002")))
# Total no of variables in the data
variables <- ncol(nfhs)
# Total number of variables in the sub section of the data.
sub_variable_count <- ncol(subset(nfhs, select = hhid:shstruc))
# Display the histogram
ggplot(data = nfhs,
       mapping = aes(x = hv009), binwidth = 1) +
  geom_histogram() +
  xlab("Number of household members")
# Urban household data
urban_household <- filter(nfhs, hv025 == 1)
# Box plot code
boxplot(hv026~hv025, 
        data=urban_household, notch=TRUE, 
        main="Mean urban household type", 
        xlab="Household type", ylab="Urban household", 
        col="Orange", horizontal = TRUE)
# Mean and median for household members
nfhs%>%
  group_by(hv026)%>%
  summarise(mean = mean(hv009), median = median(hv009))