# Predicting-High-School-Students-Academic-Performance
This project explores the factors influencing high school students' academic performance, focusing on their final grades (G3) in Portuguese. By analyzing socio-economic, demographic, and school-related variables, the project identifies key predictors and evaluates their impact using statistical and machine learning techniques.

## Project Overview
The dataset comprises information on high school students in Portugal, including parental background, study habits, and lifestyle factors. The objective is to:
- Understand the relationships between predictors and academic outcomes.
- Build statistical models to identify significant contributors to performance.
- Provide actionable insights for improving student outcomes.

## Key Features
- **Exploratory Data Analysis (EDA)**:
  - Descriptive analysis of numerical and categorical variables.
  - Visualization of key trends and distributions.
- **Statistical Tests**:
  - Conducted ANOVA and Tukey's HSD tests to determine significant mean differences in grades based on categorical predictors.
  - Regression analysis to test associations between numerical predictors and final grades (G3).
- **Model Development**:
  - Evaluated models using `PROC GLM` for binary and nominal predictors to assess their contribution to academic performance.
  - Performed additional analysis using `PROC GENMOD` for a combined view of numerical, binary, and categorical predictors.

## Results
### Significant Predictors for G3:
- **Positive Impact**:
  - **Mother's Education (Medu)**: Higher maternal education positively influences grades.
  - **Study Time**: More study time significantly improves academic outcomes.
  - **Aspiration for Higher Education**: Students aspiring to higher education score significantly better.
- **Negative Impact**:
  - **Failures**: Prior academic failures have a strong negative impact on grades.
  - **Daily Alcohol Consumption (Dalc)**: Regular alcohol consumption is associated with lower grades.
  - **Health**: Unexpectedly, better health correlates with slightly lower grades, suggesting potential confounding factors.

### Non-Significant Predictors:
- **Father's Education (Fedu)**, **Travel Time**, and **Free Time** showed limited or no significant association with academic performance.

## Methodology
- **PROC GLM**:
  - Evaluated the impact of nominal and binary variables (e.g., school type, extra support).
- **PROC GENMOD**:
  - Modeled the dependent variable (G3) incorporating all types of predictors, ensuring a comprehensive analysis.
- **Descriptive Analysis**:
  - Identified key patterns and outliers in the data.
- **Comparison of Grades (G2 and G3)**:
  - Analyzed common predictors for intermediate and final grades to ensure consistency in findings.

## Insights
1. **Impact of School Type**:
   - Students from Gabriel Pereira (GP) outperformed those from Mousinho da Silveira (MS) by an average of 1.36 points.
2. **Gender Differences**:
   - Female students scored approximately 1.2 points higher than male students.
3. **Effect of Study Habits**:
   - Study time had the largest positive impact, highlighting its importance in academic success.
4. **Lifestyle Factors**:
   - Alcohol consumption significantly decreased grades, with weekday drinking showing the strongest negative effect.


## Applications
- **Educational Policy**:
  - Design targeted interventions (e.g., increased study support, alcohol awareness programs).
- **Academic Counseling**:
  - Focus on students with prior failures or limited study time to improve outcomes.
- **Parental Guidance**:
  - Highlight the role of maternal education in fostering academic achievement.

