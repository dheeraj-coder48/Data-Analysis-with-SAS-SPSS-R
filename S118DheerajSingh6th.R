# ==========================================
# Pract 6.  Merge and Append  (Using CSV Files)
# ==========================================

library(dplyr)   # For bind_rows

# ------------------------------------------
# 1. SETUP: Read Two CSV Datasets
# ------------------------------------------

# Dataset 1: supermarket.csv
SuperMarket <- read_csv("Downloads/SuperMarket Analysis.csv")

# Dataset 2: Retail.csv
Features <- read_csv("Downloads/Features data set.csv")

print("--- Data January (SuperMarket Analysis.csv) ---")
print(head(SuperMarket))
print("--- Data February (Features data set.csv) ---")
print(head(Features))

# ------------------------------------------
# 2. MERGE (Joining Columns)
# ------------------------------------------
# Merging both datasets using the common column: "Date"

merged_data <- merge(SuperMarket, Features, by = "Date")

print("--- Merged Data (Columns Added) ---")
print(head(merged_data))

# ------------------------------------------
# 3. APPEND (Stacking Rows)
# ------------------------------------------
# Appending both datasets together (stacking rows)

final_list <- bind_rows(SuperMarket, Features)

print("--- Appended Data (Rows Added) ---")
print(head(final_list))

