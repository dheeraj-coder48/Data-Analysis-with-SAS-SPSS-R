# ==============================================================================
# R Script: Reshaping Data with pivot_longer() and pivot_wider()
# Dataset: Supermarket Sales Data
# ==============================================================================

library(dplyr)
library(tidyr)

# ==============================================================================
# 1. SETUP: Create and Import Data
# ==============================================================================

# Read data and add an InvoiceIndex (Essential for tracking rows during pivots)
df <- read.csv("Downloads/SuperMarket Analysis.csv",
               na.strings = c("", "NA")) %>%
  mutate(InvoiceIndex = row_number()) %>%
  select(InvoiceIndex, Product.line, Unit.price, Tax.5.)


print("--- 1. Original Wide Data ---")
print(head(df))

# ==============================================================================
# 2. PIVOT_LONGER (Wide to Long)
# ==============================================================================

# Combine 'Unit.price' and 'Tax.5.' into long format
long_df <- df %>%
  pivot_longer(
    cols = c(Unit.price, Tax.5.),
    names_to = "Metric",
    values_to = "Value"
  )

print("--- 2. Long Format (pivot_longer) ---")
print(head(long_df, 6))

# ==============================================================================
# 3. PIVOT_WIDER (Long to Wide)
# ==============================================================================

wide_df <- long_df %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )

print("--- 3. Wide Format (Back to Original) ---")
print(head(wide_df))

# ==============================================================================
# 4. ADVANCED EXAMPLE (Reshaping for Reporting)
# ==============================================================================

df_clean <- df %>%
  mutate(Product.line = ifelse(is.na(Product.line), "Unknown", Product.line))

category_pivot <- df_clean %>%
  select(InvoiceIndex, Product.line, Unit.price) %>%
  pivot_wider(
    names_from = Product.line,
    values_from = Unit.price
  )

print("--- 4. Category Pivot (Spreading Categories) ---")
print(head(category_pivot))

