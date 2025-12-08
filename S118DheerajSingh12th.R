# ==============================================================================
# R Script: Vertical Concatenation using rbind()
# Datasets: 'penguins_lter.csv' and 'survey.csv' (Custom)
# ==============================================================================

# 1. SETUP: Load necessary libraries
library(dplyr)

# 1.1 Load the penguins_lter dataset
penguins_df <- read.csv("Downloads/penguins_lter.csv", na.strings = c("", "NA"))
# Select relevant columns and rename for consistency
penguins_clean <- penguins_df %>%
  select(Species, Flipper.Length..mm.) %>%
  rename(
    Species = Species,
    Height = Flipper.Length..mm.
  )
penguins_clean$Height <- as.numeric(penguins_clean$Height)

# 1.2 Load the survey dataset
survey_df <- read.csv("Downloads/surveys.csv", na.strings = c("", "NA"))
# Select relevant columns and rename for consistency
survey_clean <- survey_df %>%
  select(species_id, hindfoot_length) %>%
  rename(
    Species = species_id,
    Height = hindfoot_length
  )
survey_clean$Height <- as.numeric(survey_clean$Height)

# ==============================================================================
# 2. VERTICAL COMBINATION (rbind)
# ==============================================================================

combined_data <- rbind(penguins_clean, survey_clean)

# 3. OUTPUT
print("--- Combined Data Summary ---")
print(paste("Penguins rows:", nrow(penguins_clean)))
print(paste("Survey rows:", nrow(survey_clean)))
print(paste("Total rows (Expected):", nrow(penguins_clean) + nrow(survey_clean)))
print(paste("Total rows (Actual):", nrow(combined_data)))

print("--- Preview of Combined Data (Top and Bottom) ---")
print(head(combined_data))  # Shows penguins data
print(tail(combined_data))  # Shows survey data

