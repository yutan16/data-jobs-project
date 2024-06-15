/*
Question: What are the most in-demand skills for data analysts?
Goals:
- Join job postings to inner join table similar to query 2.
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Retrieve the top 5 skills with the highest demand in the job market providing 
  insights into the most valuable skills for job seekers.
*/

SELECT
  sd.skills,
  COUNT(sj.job_id) AS demand_count
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
WHERE
  j.job_title_short = 'Data Analyst'
GROUP BY
  sd.skills
ORDER BY
  demand_count DESC
LIMIT 5;