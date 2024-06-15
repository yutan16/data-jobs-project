/*
Question: What are the top paying data analyst roles?
Goals:
- Identify the top 10 highest paying 'Data Analyst' roles that are available remotely.
- Focus on job postings with specified salaries (removing nulls).
- Highlight the top paying opportunities for Data Analysts, offering insights to opportunities.
*/

SELECT
    j.job_id,
    j.job_title,
    c.name AS company_name,
    CASE
        WHEN j.job_location = 'Anywhere' THEN 'Remote'
    END AS job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date
FROM job_postings_fact AS j
LEFT JOIN company_dim AS c ON j.company_id = c.company_id
WHERE
    j.job_title_short = 'Data Analyst' AND
    j.job_location = 'Anywhere' AND
    j.salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;