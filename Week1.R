library(haven)
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
histogram_plot <- ggplot(data = nfhs) +
                    geom_histogram(binwidth = 1, mapping = aes(x = hv009)) +
                    xlab("Number of household members")
# Urban household data
urban_household <- filter(nfhs, hv025 == 1)
# Box plot code
box_plot <- ggplot(data = urban_household, 
                   aes(x=hv009, y=as.factor(hv026))) + 
              geom_boxplot(notch = TRUE) + 
              xlab("Number of household memebers") + 
              ylab("Type of household")
# Mean and median for household members
summary_data <- nfhs%>%
                  group_by(hv026)%>%
                    summarise(mean = mean(hv009), median = median(hv009))