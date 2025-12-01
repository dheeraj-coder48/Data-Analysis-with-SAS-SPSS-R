# ==============================================================================
# R Script: Text Manipulation with stringr
# Dataset: Superstore Sales Data
# Functions: str_sub(), str_split()
# ==============================================================================

# Load necessary libraries
install.packages("stringr")
install.packages("tidyr") # for separating columns after splitting
library(stringr)
library(tidyr)
library(dplyr)

# ==============================================================================
# 1. IMPORT DATASET
# ==============================================================================

superstore_df <- read.csv("Downloads/dataset/Sample - Superstore.csv", na.strings = c("", "NA"))


print("--- Original Dataset (First 6 Rows) ---")
print(head(superstore_df[, c("Product.ID", "Product.Name")], 6))

# ==============================================================================
# 2. USING str_sub() (Substring)
# ==============================================================================

# Scenario: Extract parts of Product ID
# Format: e.g., "FUR-BO-10001798"
# Extract first 3 characters to get Category Code
superstore_df$Category_Code <- str_sub(superstore_df$Product.ID, 1, 3)

# Extract last 8 characters to get Product Number
superstore_df$Product_Num <- str_sub(superstore_df$Product.ID, -8, -1)

print("--- Data after str_sub() ---")
print(superstore_df %>% select(Product.ID, Category_Code, Product_Num) %>% head(6))

# ==============================================================================
# 3. USING str_split() (Split String)
# ==============================================================================

# Scenario: Split 'Product.Name' into Main Name and Extra Description
# We'll use " - " as separator if exists; here for demonstration, split by space first
split_matrix <- str_split(superstore_df$Product.Name, " ", n = 2, simplify = TRUE)

# Assign to new columns
superstore_df$Main_Name <- split_matrix[, 1]   # First word
superstore_df$Sub_Name  <- split_matrix[, 2]   # Remaining text

print("--- Data after str_split() ---")
print(superstore_df %>% select(Product.Name, Main_Name, Sub_Name) %>% head(6))

# ==============================================================================
# 4. BONUS: The "Tidy" Way (separate)
# ==============================================================================

# We can also separate Product.ID into Category, Type, and Number
tidy_df <- superstore_df %>%
  separate(Product.ID, into = c("Dept", "Type", "Prod_Num"), sep = "-")

print("--- Bonus: The 'separate' function ---")
print(tidy_df %>% select(Dept, Type, Prod_Num) %>% head(6))

