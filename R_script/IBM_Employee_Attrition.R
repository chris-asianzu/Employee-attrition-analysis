# Install necessary packages
install.packages("corrplot")
install.packages("caret")
install.packages("ROCR")
install.packages("ggplot2")


# Load necessary libraries
library(tidyverse)
library(corrplot)
library(caret)
library(ROCR)

# Load the CSV data
data <- read.csv("DA Career/Projects/5 Employee Attrition Analysis/dataset/IBM_HR_Employee_Attrition.csv")

# View the first few rows to understand the structure of the dataset
head(data)



# Exploratory Data Analysis (EDA)
# Perform basic exploratory analysis to understand the dataset’s key 
# characteristics.
# Summary of the dataset
summary(data)

# Check for missing values
colSums(is.na(data))

# Data structure
str(data)


# Data Cleaning
# Handling missing data (if any)
data <- na.omit(data)

# Convert categorical variables into factors
data$Attrition <- as.factor(data$Attrition)
data$Gender <- as.factor(data$Gender)
data$Department <- as.factor(data$Department)
data$JobRole <- as.factor(data$JobRole)
data$MaritalStatus <- as.factor(data$MaritalStatus)
data$OverTime <- as.factor(data$OverTime)

# View the structure again after conversion
str(data)



# Exploratory Data Visualization
# Use ggplot2 for visual exploration of relationships and trends in the 
# data.

# Distribution of Employee Age
age_plot <- ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Employee Age", x = "Age", y = "Count")

# Save the plot as PNG
ggsave("DA Career/Projects/5 Employee Attrition Analysis/visualization/age_distribution.png", plot = age_plot)


# Boxplot of Monthly Income vs Attrition
income_attrition_plot <- ggplot(data, aes(x = Attrition, y = MonthlyIncome, fill = Attrition)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Monthly Income by Attrition", x = "Attrition", y = "Monthly Income")

# Save the plot as PNG
ggsave("DA Career/Projects/5 Employee Attrition Analysis/visualization/monthly_income_by_attrition.png", plot = income_attrition_plot)



# Bar plot of Job Role vs Attrition (Proportion)
jobrole_attrition_plot <- ggplot(data, aes(x = JobRole, fill = Attrition)) +
  geom_bar(position = "fill") +
  theme_minimal() +
  labs(title = "Attrition by Job Role", x = "Job Role", y = "Proportion") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot as PNG
ggsave("DA Career/Projects/5 Employee Attrition Analysis/visualization/attrition_by_jobrole.png", plot = jobrole_attrition_plot)


# Distribution of Job Roles
jobrole_distribution_plot <- ggplot(data, aes(x = JobRole)) + 
  geom_bar(fill = "steelblue") + 
  ggtitle("Distribution of Job Roles") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot as PNG
ggsave("DA Career/Projects/5 Employee Attrition Analysis/visualization/jobrole_distribution.png", plot = jobrole_distribution_plot)



# Distribution of Departments
department_distribution_plot <- ggplot(data, aes(x = Department)) + 
  geom_bar(fill = "lightgreen") + 
  ggtitle("Distribution of Departments") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot as PNG
ggsave("DA Career/Projects/5 Employee Attrition Analysis/visualization/department_distribution.png", plot = department_distribution_plot)




# Attrition by Job Satisfaction
satisfaction_attrition_plot <- ggplot(data, aes(x = JobSatisfaction, fill = Attrition)) + 
  geom_bar(position = "fill") + 
  ggtitle("Attrition by Job Satisfaction") +
  theme_minimal()

# Save the plot as PNG
ggsave("DA Career/Projects/5 Employee Attrition Analysis/visualization/attrition_by_jobsatisfaction.png", plot = satisfaction_attrition_plot)





# Attrition by Job Level
joblevel_attrition_plot <- ggplot(data, aes(x = JobLevel, fill = Attrition)) + 
  geom_bar(position = "fill") + 
  ggtitle("Attrition by Job Level") +
  theme_minimal()

# Save the plot as PNG
ggsave("DA Career/Projects/5 Employee Attrition Analysis/visualization/attrition_by_joblevel.png", plot = joblevel_attrition_plot)



# Attrition by Department
department_attrition_plot <- ggplot(data, aes(x = Department, fill = Attrition)) + 
  geom_bar(position = "fill") + 
  ggtitle("Attrition by Department") +
  theme_minimal()

# Save the plot as PNG
ggsave("DA Career/Projects/5 Employee Attrition Analysis/visualization/attrition_by_department.png", plot = department_attrition_plot)



# Correlation Analysis
# Understand the correlation between numerical features:
# Correlation Matrix
corr_matrix <- cor(data %>% select(Age, MonthlyIncome, JobLevel, NumCompaniesWorked, TotalWorkingYears))
corrplot(corr_matrix, method = "number")



# Hypothesis Testing
# Use hypothesis testing to determine significant factors influencing 
# attrition.

# Chi-Square Test between Job Role and Attrition
chisq_test_jobrole <- chisq.test(table(data$JobRole, data$Attrition))

# T-Test between Monthly Income and Attrition
t_test_income <- t.test(MonthlyIncome ~ Attrition, data = data)

# Results
chisq_test_jobrole
t_test_income

# Building Logistic Regression Model
# Now, build a logistic regression model to predict attrition risk.

# Split data into training and testing sets (80% train, 20% test)
set.seed(123)
train_indices <- sample(1:nrow(data), 0.8 * nrow(data))
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

# Logistic Regression Model
model <- glm(Attrition ~ Age + MonthlyIncome + JobRole + Department + MaritalStatus, 
             family = "binomial", data = train_data)

# Summary of the model
summary(model)



# Model Evaluation
# Evaluate the model using a confusion matrix:

# Predictions on the test set
predictions <- predict(model, newdata = test_data, type = "response")
predicted_classes <- ifelse(predictions > 0.5, "Yes", "No")
test_data$PredictedAttrition <- predicted_classes

# Confusion Matrix
conf_matrix <- table(test_data$PredictedAttrition, test_data$Attrition)
conf_matrix



# Model Performance
# Analyze the performance using ROC Curve and Precision-Recall Curve:

# ROC Curve
roc_curve <- roc(test_data$Attrition, as.numeric(predictions))
plot(roc_curve, main = "ROC Curve")

# Precision-Recall Curve
pr_curve <- performance(prediction(predictions, test_data$Attrition), "prec", "rec")
plot(pr_curve, main = "Precision-Recall Curve")


