-- =====================================================
-- EXPLORATORY DATA ANALYSIS: WORLD LAYOFFS DATASET
-- =====================================================
-- Author: Irene Vanessa Vifah
-- Dataset: Cleaned layoffs data (2020-2023)
-- Data Source: https://www.kaggle.com/datasets/swaptr/layoffs-2022
-- Purpose: Analyze layoff trends, patterns, and insights
-- =====================================================

USE world_layoffs;

-- =====================================================
-- INITIAL DATA EXPLORATION
-- =====================================================

-- View the cleaned dataset
SELECT *
FROM layoffs_staging2;

-- =====================================================
-- MAXIMUM VALUES ANALYSIS
-- =====================================================

-- Find the maximum layoffs and highest percentage laid off
SELECT 
    MAX(total_laid_off) AS max_employees_laid_off,
    MAX(percentage_laid_off) AS max_percentage_laid_off
FROM layoffs_staging2;

-- =====================================================
-- COMPANIES WITH 100% LAYOFFS (COMPLETE SHUTDOWNS)
-- =====================================================

-- Identify companies that laid off their entire workforce
SELECT 
    company,
    location,
    industry,
    total_laid_off,
    funds_raised_millions,
    date
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- Count how many companies shut down completely
SELECT COUNT(company) AS companies_with_100_percent_layoffs
FROM layoffs_staging2
WHERE percentage_laid_off = 1;

-- Companies with 100% layoffs ranked by funding raised
-- (Well-funded companies that still failed)
SELECT 
    company,
    location,
    industry,
    total_laid_off,
    funds_raised_millions,
    date
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- =====================================================
-- COMPANY-LEVEL ANALYSIS
-- =====================================================

-- Top companies by total employees laid off (across all events)
SELECT 
    company,
    SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY company
ORDER BY total_employees_laid_off DESC
LIMIT 10;

-- =====================================================
-- INDUSTRY ANALYSIS
-- =====================================================

-- Total layoffs by industry
SELECT 
    industry,
    SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_employees_laid_off DESC;

-- =====================================================
-- GEOGRAPHIC ANALYSIS
-- =====================================================

-- Total layoffs by country
SELECT 
    country,
    SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY country
ORDER BY total_employees_laid_off DESC;

-- =====================================================
-- TEMPORAL ANALYSIS
-- =====================================================

-- Date range of the dataset
SELECT 
    MIN(`date`) AS earliest_layoff_date,
    MAX(`date`) AS latest_layoff_date
FROM layoffs_staging2;

-- Total layoffs by year
SELECT 
    YEAR(`date`) AS year,
    SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY year DESC;

-- =====================================================
-- COMPANY STAGE ANALYSIS
-- =====================================================

-- Total layoffs by company funding stage
SELECT 
    stage,
    SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY stage
ORDER BY total_employees_laid_off DESC;

-- =====================================================
-- MONTHLY TREND ANALYSIS
-- =====================================================

-- Total layoffs by month
SELECT
    SUBSTRING(`date`, 1, 7) AS month,
    SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY month
ORDER BY month ASC;

-- =====================================================
-- ROLLING TOTAL ANALYSIS
-- =====================================================

-- Calculate cumulative layoffs over time (rolling total)
WITH monthly_totals AS (
    SELECT
        SUBSTRING(`date`, 1, 7) AS month,
        SUM(total_laid_off) AS monthly_layoffs
    FROM layoffs_staging2
    WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
    GROUP BY month
    ORDER BY month ASC
)
SELECT 
    month,
    monthly_layoffs,
    SUM(monthly_layoffs) OVER (ORDER BY month) AS rolling_total_layoffs
FROM monthly_totals;

-- =====================================================
-- COMPANY PERFORMANCE BY YEAR
-- =====================================================

-- Layoffs by company and year
SELECT
    company,
    YEAR(`date`) AS year,
    SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC;

-- Top layoff events by company and year
SELECT
    company,
    YEAR(`date`) AS year,
    SUM(total_laid_off) AS total_employees_laid_off
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY total_employees_laid_off DESC;

-- =====================================================
-- TOP 5 COMPANIES BY LAYOFFS EACH YEAR
-- =====================================================

-- Identify top 5 companies with most layoffs per year
WITH company_year_totals AS (
    SELECT
        company,
        YEAR(`date`) AS year,
        SUM(total_laid_off) AS total_employees_laid_off
    FROM layoffs_staging2
    GROUP BY company, YEAR(`date`)
),
company_year_ranking AS (
    SELECT 
        company,
        year,
        total_employees_laid_off,
        DENSE_RANK() OVER (
            PARTITION BY year 
            ORDER BY total_employees_laid_off DESC
        ) AS ranking
    FROM company_year_totals
    WHERE year IS NOT NULL
)
SELECT 
    year,
    ranking,
    company,
    total_employees_laid_off
FROM company_year_ranking
WHERE ranking <= 5
ORDER BY year DESC, ranking ASC;

-- =====================================================
-- END OF EXPLORATORY ANALYSIS
-- =====================================================