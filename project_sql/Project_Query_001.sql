-- Top Paying Jobs in Data Analytics

/* 
Question: What are the top paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst jobs roles available remotely.
- Focuses on job postings with specified values (removes NULLs).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into the most employable skills
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Business Analyst' AND salary_year_avg IS NOT NULL 
    AND job_location = 'Anywhere'
ORDER BY 
    salary_year_avg DESC
LIMIT 10;