diabetes <- read.csv("Sqlite3/diabetes_prediction_india (1).csv")

diabetes$Gender <- factor(diabetes$Gender)
diabetes$Diabetes_Status <- factor(diabetes$Diabetes_Status)

table_gender_diabetes <- table(diabetes$Gender, diabetes$Diabetes_Status)

chisq.test(table_gender_diabetes)
