agri <- read.csv("Sqlite3/crop_yield.csv")

agri$Season <- factor(agri$Season)
agri$State  <- factor(agri$State)

anova_agri <- aov(Yield ~ Season * State, data = agri)
summary(anova_agri)
