#-----------------------------
# Step 0: Load the dataset
#-----------------------------
housing <- read_csv("American_Housing_Data_20231209.csv")

# Inspect first few rows
head(housing)

#-----------------------------
# Example 1: Sort by Price (ascending)
#-----------------------------
housing_sorted_price <- housing[order(housing$Price), ]

cat("First 5 cheapest houses:\n")
head(housing_sorted_price[, c("Zip Code", "Price", "Beds", "Baths", "Living Space")], 5)

#-----------------------------
# Example 2: Sort by Price (descending)
#-----------------------------
housing_sorted_price_desc <- housing[order(-housing$Price), ]

cat("\nTop 5 most expensive houses:\n")
head(housing_sorted_price_desc[, c("Zip Code", "Price", "Beds", "Baths", "Living Space")], 5)

#-----------------------------
# Example 3: Multi-column Sort
# Sort first by Beds (descending), then Price (descending)
#-----------------------------
housing_multi_sort <- housing[order(-housing$Beds, -housing$Price), ]

cat("\nTop 10 houses by Beds and Price:\n")
head(housing_multi_sort[, c("Zip Code", "Beds", "Price", "Living Space")], 10)

#-----------------------------
# Example 4: Filter and Sort
# Filter for houses with more than 3 beds, then sort by Living Space (ascending)
#-----------------------------
large_houses <- subset(housing, Beds > 3)
large_houses_sorted <- large_houses[order(large_houses$Living.Space), ]

cat("\nTop 5 large houses (Beds > 3) by smallest Living Space:\n")
head(large_houses_sorted[, c("Zip Code", "Beds", "Living Space", "Price")], 5)

