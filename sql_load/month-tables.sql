-- Creating tables for the months of Jan, Feb, and March of 2023

-- January
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact AS j
    WHERE EXTRACT(MONTH FROM j.job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact AS j
    WHERE EXTRACT(MONTH FROM j.job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact AS j
    WHERE EXTRACT(MONTH FROM j.job_posted_date) = 3;