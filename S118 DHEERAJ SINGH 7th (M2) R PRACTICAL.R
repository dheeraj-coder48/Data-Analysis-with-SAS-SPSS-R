liver <- read.csv("Sqlite3/Indian Liver Patient Dataset (ILPD).csv", header = FALSE)

colnames(liver) <- c("Age", "Gender", "Total_Bilirubin",
                     "Direct_Bilirubin", "Alkaline_Phosphotase",
                     "Alamine_Aminotransferase",
                     "Aspartate_Aminotransferase",
                     "Total_Proteins", "Albumin",
                     "Albumin_Globulin_Ratio", "Liver_Disease")

liver$Gender <- factor(liver$Gender)

anova_liver <- aov(Total_Bilirubin ~ Gender, data = liver)
summary(anova_liver)

