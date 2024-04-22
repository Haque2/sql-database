USE mini_project;
#Retrieve employee details with emphasis on education and salary
SELECT employee_id, employee_name, education, salary
FROM my_data
ORDER BY education DESC, salary DESC;




-- Analyze average salary by education level
SELECT education, AVG(salary) AS average_salary
FROM my_data
GROUP BY education
ORDER BY average_salary DESC;



#Gender might affect salary levels or positions within the company.
-- Calculate average salary by gender
SELECT gender, AVG(salary) AS average_salary
FROM my_data
GROUP BY gender
ORDER BY average_salary DESC;


-- Count of each position by gender
SELECT position, gender, COUNT(*) AS count
FROM my_data
GROUP BY position, gender
ORDER BY position, count DESC;

-- Creating a view to include age calculation

SELECT
    employee_id,
    employee_name,
    gender,
    birth_date,
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age,  -- Calculating age
    education,
    city,
    position,
    performance_review,
    salary,
    hire_date,
    overdue_vacation,
    department,
    hr_id
FROM my_data
ORDER BY age DESC;

# Analyze average salary by age group
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25 to 34'
        WHEN age BETWEEN 35 AND 44 THEN '35 to 44'
        WHEN age BETWEEN 45 AND 54 THEN '45 to 54'
        WHEN age BETWEEN 55 AND 64 THEN '55 to 64'
        WHEN age >= 65 THEN '65 and over'
        ELSE 'Age Unknown'
    END AS age_group,
    COUNT(*) AS number_of_employees,
    AVG(salary) AS average_salary
FROM employee_details_with_age
GROUP BY age_group
ORDER BY average_salary DESC;

