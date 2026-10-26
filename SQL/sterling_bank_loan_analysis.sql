select * from bank_loan_dataset;

select 
max(length(gender)),
max(length(marital_status)),
max(length(education_level)),
max(LENGTH(education_level)) AS education_level,
max(LENGTH(employment_status)) AS employment_status,
max(LENGTH(loan_purpose)) AS loan_purpose,
max(LENGTH(grade_subgrade)) AS grade_subgrade
from bank_loan_dataset;

alter table bank_loan_dataset
modify gender varchar(10),
modify marital_status varchar(10),
modify education_level varchar(12),
modify employment_status varchar(15),
modify loan_purpose varchar(20),
modify grade_subgrade varchar(5);

describe bank_loan_dataset;

select * from bank_loan_dataset;



-- TOTAL LOAN 
select count(*) as total_loan
from bank_loan_dataset;

-- TOTAL LOAN AMOUNT

select round(sum(loan_amount),1) as total_loan_amount
from bank_loan_dataset;

-- AVERAGE LOAN AMOUNT
select
round(
	avg(loan_amount)
    ,
    1) as avg_loan_amount
from bank_loan_dataset;

-- AVG INTEREST RATE
select 
concat(round(avg(interest_rate),1),'%') avg_interest_rate
from bank_loan_dataset;

-- LOAN PURPOSE BY NUMBER OF LOANS 
select
count(*) AS total_loan,
loan_purpose
from bank_loan_dataset
group by loan_purpose
order by total_loan desc;

-- LOAN PURPOSE BY TOTAL FUNDING
select 
loan_purpose,
round(sum(loan_amount),1) as loan_amount,
round(avg(loan_amount),1) avg_loan_amount
from bank_loan_dataset
group by loan_purpose
order by loan_amount desc;


-- LOAN REPAYMENT ANALYSIS 
select
case when 
loan_Paid_back = 1 
then "Yes"
when loan_paid_back = 0 
then "No" 
end as paid_back_loan,
count(*) as total_loan
from bank_loan_dataset
group by 
paid_back_loan;

-- REPAYMENT RATE

select

sum(case when loan_Paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
round(sum(case when loan_Paid_back = 1 then 1  else 0 end)/count(*)*100,1)
as repaid_loan_percentage,
round(sum(case when loan_Paid_back = 1 then 0 else 1 end)/count(*)*100,1) as unpaid_loan_percentage
from 
bank_loan_dataset;



-- AVG CREDIT SCORE ANALYSIS
select
loan_paid_back,
avg(credit_score) as avg_credit_score,
count(*) total_loan
from bank_loan_dataset
group by loan_paid_back;

-- REPAYMENT BY CREDIT SCORE CATEGORY
select
min(credit_score) min_credit,
max(credit_score) max_credit
from
bank_loan_dataset;

select * from bank_loan_dataset;
 select 
 case 
 when credit_score <= 500 then "poor"
 when credit_score <= 600 then "Fair"
 when credit_score <= 655 then "Good"
 when credit_score <= 700 then "Very Good"
 else "Excellent" 
 end as credit_score_category,
 count(*) as total_loan,
 
 sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
 sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
  round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
  round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
 
 from bank_loan_dataset
 group by 
 credit_score_category
 order by 
 repayment_rate desc,
 total_loan desc;
 
 -- CREDIT GRADE / SUBGRADE
 
 select * from bank_loan_dataset;
 
 select 
 case 
when grade_subgrade like 'A%' then 'A'
when grade_subgrade like 'B%' then 'B'
when grade_subgrade like 'C%' then 'C'
when grade_subgrade like 'D%' then 'D'
when grade_subgrade like 'E%' then 'E'
when grade_subgrade like 'F%' then 'F'
end as credit_grade,

 count(*) as total_loan,
 sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
 sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
 round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
  round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
 from 
 bank_loan_dataset
 group by 
credit_grade
order by 
repayment_rate desc,
total_loan desc;



-- DTI ANALYSIS
-- Does a high debt-to-income ratio increase repayment risk?

select 
max(debt_to_income_ratio),
min(debt_to_income_ratio)
from 
bank_loan_dataset;

select 
case
 when debt_to_income_ratio <= 0.1 then 'Very Low'
 when debt_to_income_ratio <= 0.2 then 'Low'
 when debt_to_income_ratio <= 0.3 then 'Moderate'
 when debt_to_income_ratio <= 0.4 then 'High'
  else 'Very High' end as dti_band,
count(*) as total_loan,
 sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
 sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from bank_loan_dataset
group by dti_band
order by repayment_rate desc;

-- DELINQUENCY HISTORY ANALYSIS

-- Does previous delinquency history affect repayment?
select * from bank_loan_dataset;
select 
delinquency_history,
count(*) as total_loan,
 sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
 sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from bank_loan_dataset
group by delinquency_history
order by delinquency_history desc;

-- NO of DELINQUENCIES VS REPAYMENT
select 
num_of_delinquencies,
count(*) as total_loan,
 sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
 sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from bank_loan_dataset
group by num_of_delinquencies
order by num_of_delinquencies desc;

-- DELIQUENT VS NON DELIQUENT BORROWERS 

select * from bank_loan_dataset;

select 
case
when num_of_delinquencies = 0 then "No"
else "Yes" end as delinquency_status,
count(*) as total_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from bank_loan_dataset
group by 
 delinquency_status;
 
 -- PUBLIC RECORD ANALYSIS
  
select 
public_records,
count(*) as total_loan,
sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
 from 
 bank_loan_dataset
 group by public_records
 order by repayment_rate desc;
 
 -- EMPLOYMENT STATUS
 select * from bank_loan_dataset;
 
select
employment_status,
sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from 
bank_loan_dataset
group by employment_status
order by repayment_rate desc;

-- INCOME ANALYSIS

select * from bank_loan_dataset;

select 
max(annual_income) max_income,
min(annual_income) min_income
from
bank_loan_dataset;

select 
case 
when annual_income <= 30000 then 'Low Income'
when annual_income <= 60000 then 'Lower middle Income'
when annual_income < 100000 then 'Middle Income'
else 'high income'
end as income_band,
sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
count(*) as total_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from
bank_loan_dataset
group by income_band
order by repayment_rate desc;

-- LOAN PURPOSE ANALYSIS
select * from bank_loan_dataset;

select 
loan_purpose,
sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
count(*) as total_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from
bank_loan_dataset
group by loan_purpose
order by repayment_rate desc
;

-- LOAN AMOUNT ANALYSIS

select 
min(loan_amount) min_loan,
max(loan_amount) max_loan 
from bank_loan_dataset;

select 
case
when loan_amount < 5000 then 'Below 5K'
when loan_amount <= 10000 then '5K - 10k'
when loan_amount <= 20000 then '10k - 20k'
when loan_amount <= 30000 then '20k - 30k'
else '30k+'
end as loan_amount_band,

sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
count(*) as total_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from
bank_loan_dataset
group by loan_amount_band
order by repayment_rate desc;

-- INTEREST RATE ANALYSIS

select * from bank_loan_dataset;

select 
max(interest_rate) max_interest_rate,
min(interest_rate) min_interest_rate
from bank_loan_dataset;

select
case 
when interest_rate < 5 then 'Below 5%'
when interest_rate <= 10 then '5% - 10%'
when interest_rate <= 15 then '10% - 15%'
when interest_rate <= 20 then '15% - 20%'
else 'Above 20%'
end as interest_rate_band, 
sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
count(*) as total_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate

from
bank_loan_dataset
group by interest_rate_band
order by repayment_rate desc;

-- LOAN TERM ANALYSIS
select * from bank_loan_dataset;

select 
loan_term,
sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
count(*) as total_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate

from bank_loan_dataset
group by loan_term
order by repayment_rate;

-- INSTALLMENT ANALYSIS
select * from bank_loan_dataset;
select  
max(installment) as max_installment,
min(installment) as min_installment
from bank_loan_dataset;

select  
case 
when installment <100 then 'below 100'
when installment <=300 then '100 - 300'
when installment <= 600 then '300 - 600'
when installment <= 1000 then '600 - 1000'
else 'Above 1000'
end as installment_band,
sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
count(*) as total_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate

from bank_loan_dataset
group by installment_band
order by repayment_rate desc ;

select * from bank_loan_dataset;

select 
employment_status,
 case 
 when credit_score <= 500 then "poor"
 when credit_score <= 600 then "Fair"
 when credit_score <= 655 then "Good"
 when credit_score <= 700 then "Very Good"
 else "Excellent" 
 end as credit_score_band,
 
 case 
 when debt_to_income_ratio <= 0.2 then 'Low DTI'
 when debt_to_income_ratio <= 0.4 then 'Moderate DTI'
 else 'High DTI' 
 end as dti_band,
 count(*) as total_loan,
 sum(case when loan_paid_back = 1 then 1 else 0 end) as repaid_loan,
sum(case when loan_paid_back = 0 then 1 else 0 end) as unpaid_loan,
round(sum(case when loan_paid_back = 1 then 1 else 0 end)/count(*)*100,1) as repayment_rate,
round(sum(case when loan_paid_back = 0 then 1 else 0 end)/count(*)*100,1) as non_repayment_rate
from bank_loan_dataset
group by employment_status,
credit_score_band,
dti_band
having total_loan >= 30
order by 
repayment_rate desc,
employment_status;


