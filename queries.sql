-- Data validation
SELECT COUNT(*) AS TotalSubjects
FROM kasatria_cleaned;

-- Q1: Median age
SELECT AVG(Age) AS MedianAge
FROM (
    SELECT Age
    FROM kasatria_cleaned
    ORDER BY Age
    LIMIT 2
    OFFSET 9
);

-- Q2: Average annual income by education
SELECT
    Education,
    COUNT(*) AS NumberOfPeople,
    ROUND(AVG("Annual Income"), 2) AS AverageAnnualIncome
FROM kasatria_cleaned
WHERE Education IN ('Diploma', 'Masters')
GROUP BY Education;

-- Q2: Salary difference
SELECT
    ROUND(
        AVG(CASE WHEN Education = 'Masters' THEN "Annual Income" END)
        -
        AVG(CASE WHEN Education = 'Diploma' THEN "Annual Income" END),
        2
    ) AS AnnualSalaryDifference
FROM kasatria_cleaned;

-- Q5: Phone brand among high earners
SELECT
    Brand,
    COUNT(*) AS NumberOfHighEarners
FROM kasatria_cleaned
WHERE "Monthly Income" >= 5000
GROUP BY Brand
ORDER BY NumberOfHighEarners DESC;

-- Q6: Interview channels by phone owned
SELECT
    "Phone Owned",
    Email,
    Web,
    Mobile,
    "Walk-In",
    "Video Call",
    "Phone Call",
    Letter
FROM kasatria_cleaned;