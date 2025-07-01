WITH prepared_data AS (
  SELECT 
    NumWebPurchases,
    NumStorePurchases,
    NumCatalogPurchases,
    income, 
    MntTotal,
    Kidhome + Teenhome AS total_children,
    Age,
    CASE 
      WHEN `education_2n Cycle` = 1 THEN '2n Cycle'
      WHEN education_Basic = 1 THEN 'Highschool Diploma'
      WHEN education_Graduation = 1 THEN "Bachelor's Degree"
      WHEN education_Master = 1 THEN "Master's Degree"
      WHEN education_PhD = 1 THEN 'PhD' 
      ELSE 'Unknown'
    END AS education_status,
    CASE
      WHEN marital_Divorced = 1 THEN 'Divorced'
      WHEN marital_Married = 1 THEN 'Married'
      WHEN marital_Single = 1 THEN 'Single'
      WHEN marital_Together = 1 THEN 'Dating'
      WHEN marital_Widow = 1 THEN 'Widow' 
      ELSE 'Unknown'
    END AS marital_status
  FROM u_food_marketing
)

SELECT 
  ROUND(AVG(income),2) AS avg_income, 
  ROUND(AVG(MntTotal),2) AS avg_purchase_amt,
  ROUND(AVG(NumWebPurchases),2) AS web_purchases,
  ROUND(AVG(NumStorePurchases),2) AS store_purchases,
  ROUND(AVG(NumCatalogPurchases),2) AS catalog_purchases,
  total_children,
  Age,
  education_status,
  marital_status
FROM prepared_data
GROUP BY Age, total_children, education_status, marital_status
ORDER BY Age;

SELECT AVG(Income)
FROM u_food_marketing;

SELECT AVG(Age)
FROM u_food_marketing;

SELECT AVG(Recency)
FROM u_food_marketing
GROUP BY age;