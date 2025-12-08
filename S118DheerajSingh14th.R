#==============================================================================
# R Script: Extracting Date Components using lubridate
#==============================================================================
# Load necessary libraries
install.packages("lubridate")
# install.packages("dplyr")
library(lubridate)
library(dplyr)

#==============================================================================
# 1. SETUP: Create Sample Data
#==============================================================================
# We start with dates stored as character text (ISO format YYYY-MM-DD)
dates_df <- data.frame(
  Event_ID = 1:4,
  Date_String = c("2023-03-05", "2023-05-08", "2024-01-09", "2025-01-15")
)

#==============================================================================
# 2. PARSE AND EXTRACT
#==============================================================================
# Step A: Convert String to Date object using ymd()
# Step B: Extract specific components
processed_data <- dates_df %>%
  mutate(
    # A. Parsing: Tell R this text is a date (Year-Month-Day)
    Actual_Date = ymd(Date_String),
    # B. Extraction Functions
    Year_Num = year(Actual_Date),             # Extract Year (e.g., 2023)
    Month_Num = month(Actual_Date),           # Extract Month Number (1-12)
    Month_Name = month(Actual_Date, label = TRUE), # Extract Name (Jan, Feb...)
    Day_Num = day(Actual_Date),               # Extract Day of Month (1-31)
    Weekday_Num = wday(Actual_Date),         # Day of week (1=Sun, 7=Sat)
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE), # Full Name (Sunday)
    Quarter = quarter(Actual_Date),          # Fiscal Quarter (1-4)
    Day_of_Year = yday(Actual_Date)          # Day count (1-366)
  )

print("--- Data with Extracted Date Components ---")
print(processed_data)

#==============================================================================
# 3. System Date : Handling "Now"
#==============================================================================
# Extracting components from the current system timestamp
current_time <- now()
print("--- Current Time Extraction ---")
print(paste("Current Year:", year(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))
