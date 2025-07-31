/*
Determine the highest frequency skills for Business Analysts based on their salary categories.
This query categorizes Business Analysts into salary ranges and counts the frequency of skills associated with each category
*/
WITH business_analyst_salaries AS (
SELECT 
    job_id,
    job_title_short,
    CASE 
        WHEN salary_year_avg < 50000 THEN 'Low'
        WHEN salary_year_avg BETWEEN 50000 AND 100000 THEN 'Medium'
        WHEN salary_year_avg > 100000 THEN 'High'
        ELSE 'Not Provided'
    END AS salary_category
FROM 
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
    AND job_title_short = 'Business Analyst'
)

SELECT 
    bas.salary_category,
    skills.skills,
    COUNT(*) AS skill_frequency
FROM business_analyst_salaries AS bas
INNER JOIN skills_job_dim AS skills_jobs ON skills_jobs.job_id = bas.job_id
INNER JOIN skills_dim AS skills ON skills.skill_id = skills_jobs.skill_id
GROUP BY bas.salary_category, skills.skills
ORDER BY bas.salary_category, skill_frequency DESC;