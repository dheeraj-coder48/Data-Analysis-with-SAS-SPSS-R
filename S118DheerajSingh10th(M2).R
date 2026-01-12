# Load required libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

# 1️⃣ Load CSV data
data <- read_csv("Downloads/Countries GDP 1960-2020.csv")

# 2️⃣ Reshape data from wide to long (years as variable)
data_long <- data %>%
  pivot_longer(
    cols = `1960`:`2020`,     # use the years you want
    names_to = "Year",
    values_to = "Value"
  ) %>%
  mutate(Year = as.numeric(Year))

# -------------------------
# 3️⃣ Scatter Plot
# Example: India GDP over time
ggplot(
  data_long %>% filter(`Country Name` == "India"),
  aes(x = Year, y = Value)
) +
  geom_point(color = "blue", size = 3) +
  theme_minimal() +
  labs(
    title = "Scatter Plot: India GDP (1960–2020)",
    x = "Year",
    y = "GDP (USD)"
  )

# -------------------------
# 4️⃣ Pie Chart
# Top 5 countries by total GDP (2010–2020)
pie_data <- data_long %>%
  group_by(`Country Name`) %>%
  summarise(Total = sum(Value, na.rm = TRUE)) %>%
  arrange(desc(Total)) %>%
  slice(1:5)   # take top 5 countries

ggplot(pie_data, aes(x = "", y = Total, fill = `Country Name`)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  theme_void() +
  labs(title = "Pie Chart: Top 5 Countries by Total GDP (2010–2020)")

# -------------------------
# 5️⃣ High–Low Chart
# Min and Max GDP per year across all countries
hl_data <- data_long %>%
  group_by(Year) %>%
  summarise(
    Low = min(Value, na.rm = TRUE),
    High = max(Value, na.rm = TRUE)
  )

ggplot(hl_data, aes(x = Year)) +
  geom_linerange(aes(ymin = Low, ymax = High), color = "darkgreen", size = 1.5) +
  theme_minimal() +
  labs(
    title = "High–Low Chart: GDP Range Across Countries (2010–2020)",
    x = "Year",
    y = "GDP Range (USD)"
  )
