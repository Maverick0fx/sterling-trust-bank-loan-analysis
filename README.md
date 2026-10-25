# Sterling Trust Bank | Loan Portfolio & Credit Risk Analysis

## Project Overview
This project analyses 20,000 loan records to evaluate loan repayment performance, identify credit risk patterns, and provide recommendations to improve lending decisions.

**Tools:** MySQL, Excel, Power Query, Power BI, Tableau

## 1. SQL Analysis — MySQL
I used MySQL to explore the dataset, analyse repayment outcomes, and identify patterns across customer and loan characteristics.

I created the following categories to support the analysis:
- **Credit Score Bands:** Grouped borrowers by credit score.
- **DTI Bands:** Categorised debt-to-income ratios.
- **Income Bands:** Grouped borrowers by annual income.
- **Loan Amount Bands:** Categorised loans by amount.
- **Interest Rate Bands:** Grouped loans by interest rate.
- **Credit Grades:** Grouped subgrades (A1–A5, B1–B5, etc.) into their main grades.
- **Delinquency Status:** Classified borrowers based on recorded delinquencies.

## 2. Power BI Dashboard

I used Power Query for data preparation and DAX to create measures and visualise loan performance, repayment rates, and credit risk.

### Loan Portfolio Overview
![Loan Portfolio Overview](Power-BI/Screenshots/01-Loan-Portfolio-Overview.png)

### Credit Risk Analysis
![Credit Risk Analysis](Power-BI/Screenshots/02-Credit-Risk-Analysis.png)

### High-Risk Customer Analysis
![High-Risk Customer Analysis](Power-BI/Screenshots/03-High-Risk-Customer-Analysis.png)

### Key Findings and Recommendations
![Key Findings and Recommendations](Power-BI/Screenshots/04-Key-Findings-and-Recommendations.png)

## 3. Tableau Dashboard

I recreated the analysis in Tableau, building interactive dashboards to explore loan portfolio performance and credit risk.

### Loan Portfolio Overview
![Tableau Loan Portfolio Overview](Tableau/Screenshots/07-Tableau-Loan-Portfolio-Overview.png)

### Credit Risk Analysis
![Tableau Credit Risk Analysis](Tableau/Screenshots/08-Tableau-Credit-Risk-Analysis.png)

## 4. Key Findings

- **Credit Score:** Borrowers with scores above 700 had an 89% repayment rate, compared with 65% for scores below 500.
- **DTI:** Borrowers with low DTI had approximately 91% repayment, while the 40%+ DTI group had a 43% non-repayment rate.
- **Credit Grade:** Grade A recorded a 95% repayment rate, while Grade F recorded 68%.
- **Employment Status:** Retired borrowers recorded 99% repayment. Employed and self-employed borrowers each recorded approximately 89%.
- **Income:** Repayment rates were at least 79% across all income bands.
- **Loan Purpose:** Education and medical loans recorded non-repayment rates of approximately 22%.
- **Loan Amount:** Loans above 30k had an 81% repayment rate, compared with 80% for loans below 5k.
- **Interest Rate:** Loans with interest rates of 20% and above recorded a 67% repayment rate.
- **High-Risk Segments:** Several unemployed borrower segments combining specific credit score and DTI bands recorded 100% non-repayment.

## 5. Recommendations

1. **Improve Loan Approval Decisions:** Assess applicants' repayment capacity, particularly unemployed borrowers with other risk indicators.
2. **Strengthen Credit Assessment:** Consider credit scores, DTI ratios, employment status, and delinquency history.
3. **Improve Risk Monitoring:** Monitor higher-risk customer segments and identify early signs of repayment difficulties.
4. **Use Risk-Based Interest Rates:** Consider borrowers' credit profiles and repayment capacity when setting interest rates.
5. **Manage High-Risk Segments:** Pay closer attention to younger, unemployed, and student borrowers when assessing repayment capacity.
6. **Set Appropriate Loan Limits:** Consider income, existing debts, employment status, and repayment capacity when determining loan amounts.
