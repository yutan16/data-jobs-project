/*
Question: What are the top skills based on salary (Top 25)?
Goals: 
- Look at the average salary associated with each skill for Data Analyst positions.
- Focus on roles with specified salaries, regardless of location.
- Help reveal how different skills impact salary levels for Data Analysts and identify
  the most financially rewarding skills to acquire.
*/

SELECT
  sd.skills,
  ROUND(AVG(j.salary_year_avg), 0) AS avg_annual_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
INNER JOIN skills_dim AS sd ON sj.skill_id = sd.skill_id
WHERE
  j.job_title_short = 'Data Analyst' AND
  j.salary_year_avg IS NOT NULL
GROUP BY
  sd.skills
ORDER BY
  avg_annual_salary DESC
LIMIT 25;

/*
Some key trends:

High-Paying Skills:
- SVN tops the list with an average annual salary of $400,000.
- Solidity follows at $179,000, reflecting the high demand in blockchain and smart contract development.
- Other notable high-paying skills include Couchbase ($160,515), DataRobot ($155,486), and Golang ($155,000).

Machine Learning and AI:
- Several skills related to machine learning and AI, such as MXNet ($149,000), Keras ($127,013), PyTorch ($125,226),
  and TensorFlow ($120,647), command high salaries.

DevOps and Infrastructure:
- Skills in DevOps and infrastructure, such as Terraform ($146,734), VMware ($147,500), and Puppet ($129,820), are also
  highly valued.

Data Management and Processing:
- Tools for data management and processing like Kafka ($129,999), Cassandra ($118,407), and Airflow ($116,387) show strong
  salary figures, indicating their importance in handling big data.

Other Notable Skills:
- Gitlab ($134,126), Ansible ($124,370), and Hugging Face ($123,950) are also among the top-paying skills.

Visualization: "Top Paying Skills for Data Analysts in 2023.png" in visualization folder.

Results:
[
  {
    "skills": "svn",
    "avg_annual_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_annual_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_annual_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_annual_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_annual_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_annual_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_annual_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_annual_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_annual_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_annual_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_annual_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_annual_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_annual_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_annual_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_annual_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_annual_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_annual_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_annual_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_annual_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_annual_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_annual_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_annual_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_annual_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_annual_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_annual_salary": "115480"
  }
]
*/