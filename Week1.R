# Loading the data
nfhs <- read_dta("IAHR52FL.dta")
# Total number of households
household_count <- nrow(unique(select(nfhs, "hv002")))
# Total no of variables in the data
variables <- ncol(nfhs)
# Total number of variables in the sub section of the data.
sub_variable_count <- ncol(select(nfhs, hhid:shstruc))