# Employee Attrition Analysis

## Introduction
This project focuses on analyzing employee attrition to uncover the key factors driving turnover and to develop predictive models for forecasting employee exits. Using a comprehensive dataset of 1,470 employees across 35 variables, this analysis incorporates data cleaning, exploratory analysis, statistical testing, and predictive modeling to deliver actionable insights.

---

## Dataset Overview
- Size: 1,470 employees
- Features: 35 attributes including demographic, job-related, and performance metrics
- Key Categories:
  - Demographics: Age, Gender, Marital Status, Education
  - Job-related: Job Role, Department, Monthly Income, Job Satisfaction, etc.
  - Performance: Attrition, OverTime, Environment Satisfaction

---

## Step 1: Data Cleaning & Preprocessing
- No missing values
- Converted categorical variables (e.g. JobRole, Department, Attrition) into factors
- Ensured data consistency for analysis and modeling

---

## Step 2: Exploratory Data Analysis (EDA)
Key visual insights revealed:
- Age Distribution: Most employees are aged 30–50
- Attrition vs. Monthly Income: Lower-income employees are more likely to leave
- By Job Role: High attrition in "Laboratory Technician" and "Sales Executive"
- By Department: Sales has relatively higher attrition
- Job Satisfaction: Lower satisfaction correlates with higher attrition

---

## Step 3: Statistical Testing
- Chi-Square Test (Job Role vs. Attrition):  
  Significant (p = 2.75e-15) – certain job roles have higher attrition
- T-Test (Monthly Income vs. Attrition):  
  Significant (p = 4.43e-13) – lower income is linked to higher attrition

---

## Step 4: Correlation Analysis
- Moderate positive correlation between Monthly Income and Job Level
- Weak correlations among other variables like Age, Total Working Years, etc.

---

## Step 5: Predictive Modeling — Logistic Regression
Model Goal: Predict the likelihood of an employee leaving (Attrition)

Features used:
- Age
- Monthly Income
- Job Role
- Department
- Marital Status

Key Outcomes:
- Age: Strong negative correlation (younger employees more likely to leave)
- Monthly Income: Not statistically significant but still relevant
- Job Role: Certain roles (e.g., Laboratory Technician) are high-risk
- Department & Marital Status: Not significant in this model

---

## Step 6: Model Evaluation
- Evaluated using Accuracy, Precision, Recall, and ROC AUC
- Model performed reasonably but can be improved with:
  - Additional features
  - Alternative machine learning models (e.g. Random Forest, XGBoost)
  - Hyperparameter tuning

---

## Key Findings
- Low Income and High Attrition: Employees with lower salaries are more likely to leave
- High-Risk Roles: Sales Executives and Laboratory Technicians experience higher turnover
- Younger Employees: Higher attrition among employees under 30
- Departmental Differences: Sales shows higher attrition but not statistically significant

---

## Recommendations
1. Compensation Optimization: Improve salaries for at-risk roles to reduce turnover
2. Improve Job Satisfaction: Conduct surveys and act on employee feedback to boost morale
3. Targeted Retention Strategies: Focus on high-turnover roles with tailored interventions
4. Career Development: Provide growth opportunities and clear progression paths for junior staff

---

## Tools & Technologies Used
- Language: R or Python
- Libraries: dplyr, ggplot2, stats, caret, etc.
- Methods: EDA, Chi-Square, T-Test, Correlation, Logistic Regression, ROC Analysis
- Platform: GitHub for version control and documentation

---

---

## Contributions
Project authored by chris-asianzu.  
Contributions, suggestions, and collaborations are welcome via pull requests or issues.

---

## License
This project is released under the MIT License.
