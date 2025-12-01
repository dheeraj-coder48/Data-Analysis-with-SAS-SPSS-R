#7.  Selecting and dropping variables using select() in R. 
# ==============================================================================
# 1. IMPORT DATASET
# ==============================================================================
library(dplyr) # select() is part of the dplyr package

# Import the CSV file
std_performance <- read_csv("Downloads/StudentsPerformance.csv")

print("--- Original Dataset (First 3 rows) ---")
print(head(std_performance, 3))

# ==============================================================================
# 2. SELECTING VARIABLES (Keeping Columns)
# ==============================================================================

# Method A: Select specific columns by name
# Scenario: We only want Gender, Lunch type, and Math score
selected_cols <- std_performance %>%
  select(gender, lunch, `math score`)

print("--- Selected Specific Columns ---")
print(head(selected_cols, 3))

# Method B: Select a range of adjacent columns
# Scenario: Select everything from 'gender' to 'lunch'
range_cols <- std_performance %>%
  select(gender:`lunch`)

print("--- Selected Range of Columns ---")
print(head(range_cols, 3))

# Method C: Select using helper functions (e.g., starts_with)
# Scenario: Select columns that start with "r" (race/ethnicity, reading score)
starts_with_r <- std_performance %>%
  select(starts_with("r"))

print("--- Selected columns starting with 'r' ---")
print(head(starts_with_r, 3))

# ==============================================================================
# 3. DROPPING VARIABLES (Removing Columns)
# ==============================================================================
# We use the minus sign (-) to remove variables

# Method A: Drop a single specific column
# Scenario: Remove the 'lunch' column
dropped_one <- std_performance %>%
  select(-lunch)

print("--- Dataset with 'lunch' dropped ---")
print(names(dropped_one))

# Method B: Drop multiple columns
# Scenario: Remove 'gender' and 'writing score'
dropped_multiple <- std_performance %>%
  select(-gender, -`writing score`)

print("--- Dataset with 'gender' and 'writing score' dropped ---")
print(names(dropped_multiple))

# Method C: Drop a range of columns
# Scenario: Remove everything from 'parental level of education' to 'reading score'
dropped_range <- std_performance %>%
  select(-(`parental level of education`:`reading score`))

print("--- Dataset with range 'parental level of education' to 'reading score' dropped ---")
print(names(dropped_range))
