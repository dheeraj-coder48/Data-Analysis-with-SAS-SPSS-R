#==============================================================================
  # R Script: Identifying and Handling Duplicates
  # Function: distinct() from the dplyr package
  #
#==============================================================================
  # Load the library
  library(dplyr)
#==============================================================================
  # 1. SETUP: Create a Dataset with Intentional Duplicates
  # ==============================================================================
  # - Row 1 and Row 6 are EXACT duplicates (Same ID, Name, and Item)
  # - Row 2 and Row 3 are EXACT duplicates
  # - Row 5 and 7 share the same Name ("Dan"), but bought different items.
  orders_df <- data.frame(
    OrderID = c(101, 102, 102, 103, 104, 101, 104),
    Customer = c("Dheeraj", "Manya", "Kaju", "Pista", "Badam", "kaju", "Manya"),
    Product = c("Laptop", "Phone", "Phone", "Tablet", "Monitor", "Laptop",
                "Mouse")
  )
  print("--- 1. Original Dataset (Note 7 rows) ---")
  print(orders_df)
  #==============================================================================
    # 2. IDENTIFYING DUPLICATES (Before removing them)
    #==============================================================================
    # We can use group_by() and count() to see which rows appear more than once.
    duplicates_report <- orders_df %>%
    group_by(OrderID, Customer, Product) %>%
    count() %>% # Counts occurrences
    filter(n > 1) # Keeps only rows that appear more than once
  print("--- 2. Identification Report (Rows that are duplicated) ---")
  print(duplicates_report)
  #==============================================================================
    # 3. HANDLING DUPLICATES: Exact Matches
    #==============================================================================
    # Scenario: Remove rows where EVERY column is identical.
    # Result: Alice (101) and Bob (102) duplicates are removed.
    # Dan (104) is kept twice because his Products are different ("Monitor" vs"Mouse").
clean_exact <- orders_df %>%
  distinct()
print("--- 3. Removed Exact Duplicates (distinct) ---")
print(clean_exact)
#==============================================================================
  # 4. HANDLING DUPLICATES: Specific Columns (.keep_all = TRUE)
  #==============================================================================
  # Scenario: We want a list of UNIQUE CUSTOMERS.
  # If "Dan" appears twice, we only want the first time he appears.
  # Important: We must use .keep_all = TRUE to keep the other columns (Product,ID).
unique_customers <- orders_df %>%
  distinct(Customer, .keep_all = TRUE)
print("--- 4. Unique Customers Only (Partial Duplicates removed) ---")
# Notice Dan only appears once now (the "Mouse" entry is dropped)
print(unique_customers)

