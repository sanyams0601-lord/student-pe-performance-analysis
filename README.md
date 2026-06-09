<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/79e778fd-905c-4d6f-aef4-c7488f4e4b08" /># student-pe-performance-analysis
Statistical analysis of student PE performance using R — probability calculations, hypothesis testing (Z-tests, confidence intervals), and data visualization with bubble charts
# Student PE Performance Analysis

##  Overview
This project analyzes student physical education performance data using **R programming**.  
It applies statistical inference methods including probability calculations, Bayes theorem, Z-test for proportions, and confidence intervals.  
Visualizations such as bubble charts are used to compare grade-level performance.

##  Dataset
- File: `student_pe_performance.csv`
- Attributes: strength, endurance, flexibility, BMI, motivation, attendance, and overall PE performance.

##  Methods
- Data cleaning and preprocessing in R
- Probability calculations (P(High Performer | High Motivation))
- Z-test for proportions between motivation groups
- Confidence interval estimation for sample proportions
- Bubble chart visualization of grade-level performance

## 📊 Key Findings
- High motivation students show a significantly higher probability of being high performers.
- Grade-level averages vary, with bubble sizes representing student counts.
- Confidence interval for sample proportion (p̂ = 0.64, n = 100) was [0.54, 0.74].
