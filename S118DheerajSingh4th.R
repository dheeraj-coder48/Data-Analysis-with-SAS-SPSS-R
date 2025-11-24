# Install & load libraries
install.packages("dplyr")
library(dplyr)
library(readr)

# Load your HR dataset
hr <- read_csv("Downloads/HR-Employee-Attrition.csv")

# Quick look
head(hr)


# -------------------------------------------------------
# Method 1: Using subset()  (Base R)
# -------------------------------------------------------

# Example 1: Single Condition
# Filter employees with MonthlyIncome > 10000
high_income_subset <- subset(hr, MonthlyIncome > 10000)

cat("Number of high-income employees (MonthlyIncome > 10000):",
    nrow(high_income_subset), "\n")

summary(high_income_subset$MonthlyIncome)


# Example 2: Multiple Conditions (AND)
# Employees with MonthlyIncome > 10000 AND YearsAtCompany < 5
young_high_income_subset <- subset(hr,
                                   MonthlyIncome > 10000 & YearsAtCompany < 5)

cat("Employees earning >10000 AND less than 5 years in company:",
    nrow(young_high_income_subset), "\n")

head(young_high_income_subset)


# Example 3: Multiple Conditions (OR)
# Employees with OverTime == "Yes" OR JobSatisfaction > 3
overtime_or_happy_subset <- subset(hr,
                                   OverTime == "Yes" | JobSatisfaction > 3)

cat("Employees working overtime OR highly satisfied:",
    nrow(overtime_or_happy_subset), "\n")

head(overtime_or_happy_subset)



# -------------------------------------------------------
# Method 2: Using dplyr::filter() with the pipe operator
# -------------------------------------------------------

# Example 1: Single Condition
# Filter employees with DistanceFromHome < 5
short_distance_filter <- hr |>
  filter(DistanceFromHome < 5)

cat("Employees living within 5 km:", nrow(short_distance_filter), "\n")
summary(short_distance_filter$DistanceFromHome)


# Example 2: Multiple Conditions (comma = AND)
# Employees in Research & Development AND Attrition = Yes
rd_attrition_filter <- hr |>
  filter(Department == "Research & Development",
         Attrition == "Yes")

cat("Employees in R&D who left the company:", nrow(rd_attrition_filter), "\n")
head(rd_attrition_filter)


# Example 3: Checking for values in a set (%in%)
# Employees with JobRole either 'Sales Executive' or 'Research Scientist'
role_filter <- hr |>
  filter(JobRole %in% c("Sales Executive", "Research Scientist"))

cat("Employees in Sales Executive or Research Scientist roles:",
    nrow(role_filter), "\n")

table(role_filter$JobRole)
