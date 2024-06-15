/*
Question: What are the most (Top 25) optimal skills to learn (a.k.a. high in demand & pay)?
Goals:
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrates on remote positions with specified salaries.
- Target skills that offer job security and financial benefits which offer strategic insights for career 
  development in data analysis.
*/

WITH skills_demand AS (
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(sj.job_id) AS demand_count
    FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
    WHERE
        j.job_title_short = 'Data Analyst' AND
        j.salary_year_avg IS NOT NULL AND
        j.job_work_from_home = TRUE
    GROUP BY
        sd.skill_id
), 

average_salary AS (
    SELECT
        sd.skill_id,
        sd.skills,
        ROUND(AVG(j.salary_year_avg), 0) AS avg_annual_salary
    FROM job_postings_fact AS j
    INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
    INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
    WHERE
        j.job_title_short = 'Data Analyst' AND
        j.salary_year_avg IS NOT NULL AND
        j.job_work_from_home = TRUE
    GROUP BY
        sd.skill_id
)

SELECT
    s.skill_id,
    s.skills,
    demand_count,
    avg_annual_salary
FROM skills_demand as s
INNER JOIN average_salary AS a ON s.skill_id = a.skill_id
WHERE
    demand_count > 10
ORDER BY
    demand_count DESC -- Order by demand
    --avg_annual_salary DESC -- Order by salary
LIMIT 25;

/*
Overall Analysis of the Insights:
Summary:
To maximize career potential as a data analyst, it’s beneficial to focus on skills that are both in
high demand and command higher salaries. This includes mastering widely used tools like SQL, Python, 
and Tableau, while also developing expertise in specialized, high-paying areas such as Go, Hadoop, 
and cloud platforms like Azure and AWS. Balancing these skills will provide both job security and the 
potential for higher earnings.

Visualization: "Top 10 Paying & Top In-Demand Skills For Data Analysts In 2023.png"
               in visualization folder.

Results:
[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "398",
    "avg_annual_salary": "97237"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "256",
    "avg_annual_salary": "87288"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_annual_salary": "101397"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_annual_salary": "99288"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_annual_salary": "100499"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "110",
    "avg_annual_salary": "97431"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_annual_salary": "98902"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_annual_salary": "98902"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "58",
    "avg_annual_salary": "88701"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_annual_salary": "103795"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "48",
    "avg_annual_salary": "82576"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_annual_salary": "112948"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_annual_salary": "104534"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_annual_salary": "97786"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_annual_salary": "111225"
  },
  {
    "skill_id": 192,
    "skills": "sheets",
    "demand_count": "32",
    "avg_annual_salary": "86088"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_annual_salary": "108317"
  },
  {
    "skill_id": 215,
    "skills": "flow",
    "demand_count": "28",
    "avg_annual_salary": "97200"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_annual_salary": "115320"
  },
  {
    "skill_id": 22,
    "skills": "vba",
    "demand_count": "24",
    "avg_annual_salary": "88783"
  },
  {
    "skill_id": 199,
    "skills": "spss",
    "demand_count": "24",
    "avg_annual_salary": "92170"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_annual_salary": "113193"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_annual_salary": "97587"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_annual_salary": "104918"
  },
  {
    "skill_id": 195,
    "skills": "sharepoint",
    "demand_count": "18",
    "avg_annual_salary": "81634"
  }
]
*/
