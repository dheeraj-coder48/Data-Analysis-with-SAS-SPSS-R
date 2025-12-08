#==============================================================================
# R Script: Generating Basic Summaries
# Functions: str() and summary()
# Dataset: Retail Product Data (Simulated)
#==============================================================================

#==============================================================================
# 1. SETUP: Create Sample Data
#==============================================================================
# We create a dataframe with mixed data types (Numeric, Character, Logical, NA)
retail_df <- data.frame(
  ID = 1:6,
  Category = c("Electronics", "Home", "Electronics", "Clothing", "Home", "Clothing"),
  Price = c(500.50, 45.00, 900.00, NA, 300.00, 25.00), # Note the NA
  In_Stock = c(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE),
  Rating = c(4.5, 3.8, 4.9, 4.0, 3.5, 4.2)
)
print("--- Data Loaded ---")

#==============================================================================
# 2. USING str() (Structure)
#==============================================================================
# Purpose: Compactly display the internal structure of the R object.
# What it tells you:
# - The class (data.frame)
# - Number of observations (rows) and variables (columns)
# - The Data Type of each column (num, int, chr, logi)
# - The first few values
print("--- OUTPUT OF str() ---")
str(retail_df)

#==============================================================================
# 3. USING summary() (Statistical Summary)
#==============================================================================
# Purpose: detailed summary statistics for each column.
# What it tells you:
# - Numeric Cols: Min, 1st Qu, Median, Mean, 3rd Qu, Max, and NA count.
# - Logical Cols: Count of TRUE vs FALSE.
# - Character Cols: Length and Class (Usually not very useful yet).
print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(retail_df)

#==============================================================================
# 4. IMPROVING summary() WITH FACTORS
#==============================================================================
# By default, R treats text as "Character" and summary() just counts the length.
# If we convert 'Category' to a 'Factor', summary() will calculate counts per category.
retail_df$Category <- as.factor(retail_df$Category)
print("--- OUTPUT OF summary() [After Factor Conversion] ---")
# Notice how 'Category' now shows: Clothing:2, Electronics:2, Home:2
summary(retail_df)

#==============================================================================
# 5. Accessing Specific Summaries
#==============================================================================
# Sometimes you don't want the whole block, just specific numbers.
avg_rating <- mean(retail_df$Rating)
max_price <- max(retail_df$Price, na.rm = TRUE) # na.rm ignores the missing value

print(paste("Average Rating:", avg_rating))
print(paste("Highest Price:", max_price))
