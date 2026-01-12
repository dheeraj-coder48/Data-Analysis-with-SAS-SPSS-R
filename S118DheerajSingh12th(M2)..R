
library(readr)

data <- read_csv("Downloads/Placement_Data_Full_Class.csv")

numeric_data <- data[sapply(data, is.numeric)]

correlation_matrix <- cor(
  numeric_data,
  use = "complete.obs",
  method = "pearson"
)

print(correlation_matrix)

heatmap(
  correlation_matrix,
  main = "Correlation Matrix Heatmap",
  col = heat.colors(64),
  symm = TRUE
)
