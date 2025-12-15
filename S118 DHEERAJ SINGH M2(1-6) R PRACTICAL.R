install.packages("dplyr") 
install.packages("psych") 

library(dplyr) 
library(psych)

df <- read.csv("NetBeansProjects/diabetes.csv")



df$GlucoseLevel <- ifelse(df$Glucose >100,"High","Low")
#print(df$Glucose)

print("1.Descriptive Statistics")
print("Summary of Blood Pressure : ")
summary(df$BloodPressure)

print("Detailed Description of Age : ")
describe(df$Age)




#2nd Practical Generating frequency tables using table() or count()

print("2.Frequency Tables (BMI Distribution)")
bmi_counts <- table(df$BMI)
print(bmi_counts)


BMI_df <- df %>% count(BMI)
print(BMI_df)




#3rd Practical: Creating cross-tabulations and two-way tables using table()
print("3. Cross Tabulation ")

cross_tab <- table(df$Age,df$Pregnancies)

print(cross_tab)





#4th Practical Performing one-sample t-tests using t.test()
print("4.")

t_test_one <- t.test (df$BMI,mu=25)
print(t_test_one)






#5 Practical Performing independent two-sample t-tests using t.test() with grouping
print("5. Independent Two-Sample t-test")
t_test_two <- t.test(df$Age~ df$GlucoseLevel,data = df)
print(t_test_two)


#6th Practical Performing paired t-tests using t.test(paired=TRUE)
print("6.Paired t-test")
df$BMI_after <- df$BMI + rnorm(nrow(df), 0, 1)
t_test_paired <- t.test(df$BMI, df$BMI_after, paired = TRUE)
print(t_test_paired)


