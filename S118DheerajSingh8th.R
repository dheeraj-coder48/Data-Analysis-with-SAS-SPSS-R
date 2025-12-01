# ==============================================================================
# R Script: Handling Missing Values (Data Cleaning)
# Dataset: Medical Insurance Data
# ==============================================================================

# Load necessary libraries
install.packages("tidyr")
library(dplyr)
library(tidyr) # Contains replace_na()

# ==============================================================================
# 1. CREATE AND IMPORT DATASET
# ==============================================================================

# Read dataset (treat empty cells as NA)
insurance_df <- read_csv("Downloads/dataset/insurance.csv")

print("--- 1. Original Data (First 6 Rows) ---")
print(head(insurance_df))

# Check how many NAs are in each column
print("--- Count of Missing Values per Column ---")
print(colSums(is.na(insurance_df)))

# ==============================================================================
# 2. METHOD A: REMOVE MISSING VALUES (na.omit)
# ==============================================================================
# This removes any row containing at least one NA.

clean_omit <- na.omit(insurance_df)

print("--- 2. Data after na.omit() ---")
print(paste("Original rows:", nrow(insurance_df)))
print(paste("Rows remaining:", nrow(clean_omit)))
print(head(clean_omit))

# ==============================================================================
# 3. METHOD B: REPLACE MISSING VALUES (replace_na)
# ==============================================================================
# Fill missing values with logical defaults.
# Strategy:
# 1. sex      → "unknown"
# 2. smoker   → "unknown"
# 3. region   → "unknown"
# 4. bmi      → mean BMI
# 5. children → 0
# 6. charges  → mean charges

# Calculate averages
avg_bmi <- mean(insurance_df$bmi, na.rm = TRUE)
avg_charges <- mean(insurance_df$charges, na.rm = TRUE)

clean_replace <- insurance_df %>%
  replace_na(list(
    sex = "unknown",
    smoker = "unknown",
    region = "unknown",
    bmi = avg_bmi,
    children = 0,
    charges = avg_charges
  ))

print("--- 3. Data after replace_na() ---")
print(clean_replace[3, ]) 
print(head(clean_replace))

# Verify remaining NAs
print("--- Remaining NAs after replacement ---")
print(colSums(is.na(clean_replace)))

