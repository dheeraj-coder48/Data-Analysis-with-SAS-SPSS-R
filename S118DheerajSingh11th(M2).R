library(ggplot2)
library(dplyr)
library(readr)

data <- read_csv("Downloads/placements dataset.csv")

ggplot(data, aes(x = Salary)) +
  geom_histogram(
    binwidth = 200000,  
    fill = "skyblue",
    color = "black"
  ) +
  theme_minimal() +
  labs(
    title = "Histogram of Student Salaries",
    x = "Salary (INR)",
    y = "Frequency"
  )

ggplot(data, aes(x = Gender, y = Salary, fill = Gender)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Box Plot of Salary by Gender",
    x = "Gender",
    y = "Salary (INR)"
  ) +
  theme(legend.position = "none")
