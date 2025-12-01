# Layoffs Exploratory Data Analysis

## Project Overview
This project performs comprehensive exploratory data analysis (EDA) on cleaned layoff data spanning 2020-2023. Using SQL queries, this analysis uncovers trends, patterns, and insights about company layoffs across industries, geographic regions, and time periods.

## Dataset Information
- **Source**: [Kaggle - Layoffs 2022](https://www.kaggle.com/datasets/swaptr/layoffs-2022)
- **Records**: 1,994 layoff events
- **Companies**: 1,628 unique companies
- **Industries**: 30 sectors
- **Countries**: 51 nations
- **Time Period**: March 11, 2020 - March 6, 2023

## Analysis Objectives

This exploratory analysis answers key business questions:

1. Which companies had the most significant layoffs?
2. What industries were hit hardest?
3. How do layoffs vary by geographic region?
4. What temporal trends exist in the data?
5. How do layoffs relate to company funding stage?
6. Which companies shut down completely (100% layoffs)?
7. What are the month-over-month trends?
8. Who were the top affected companies each year?

## Key Findings

### Companies with Complete Shutdowns
- **Total companies with 100% layoffs**: 115 companies
- Notable well-funded companies completely shut down despite significant funding
- Analysis reveals that high funding does not guarantee survival
- Well-funded startups and established companies alike experienced complete closures

### Industry Impact
- **Hardest hit industry**: Consumer sector
- Consumer and retail industries show the highest concentration of total layoffs
- Technology sector also heavily impacted with significant workforce reductions
- Service-based industries particularly vulnerable to economic shifts

### Geographic Patterns
- **Country with most layoffs**: United States
  - **Total layoffs**: 256,559 employees
  - **Second place**: India with 35,993 layoffs
  - **Third place**: Netherlands with 17,220 layoffs
- Layoffs heavily concentrated in major tech hubs (San Francisco Bay Area, Seattle, New York)
- Global nature of downturn evident across 51 countries
- US accounts for the majority of total layoffs due to concentration of large tech companies

### Temporal Trends
- **Peak layoff period**: January 2023
- **Initial COVID-19 impact**: Visible spike in March-April 2020
- **Recovery period**: 2021 showed reduced layoff activity
- **Second major wave**: 2022-2023 during tech industry correction and economic uncertainty
- **Rolling total**: 383,089 employees laid off cumulatively over 3 years
- Clear correlation between economic events and layoff patterns

### Year-over-Year Patterns
- **2020**: COVID-19 pandemic initial impact with sudden workforce reductions
- **2021**: Recovery period with significantly fewer layoffs
- **2022-2023**: Tech industry correction, rising interest rates, and economic uncertainty drove major layoffs

### Company Stage Analysis
- Post-IPO and late-stage companies show higher absolute layoff numbers
- Early-stage startups more likely to shut down completely (100% layoffs)
- Established companies conducting large-scale restructuring efforts
- Funding stage correlates with layoff patterns and company survival

## Analysis Structure

### 1. Initial Data Exploration
- Maximum values analysis
- Dataset overview and validation

### 2. Company-Level Analysis
- Total layoffs by company
- Companies with 100% workforce reduction
- Well-funded companies that failed

### 3. Industry Analysis
- Layoffs aggregated by industry sector
- Identifying most affected industries

### 4. Geographic Analysis
- Country-level layoff distribution
- Regional patterns and trends

### 5. Temporal Analysis
- Date range verification
- Year-over-year comparison
- Monthly trends
- Rolling totals (cumulative impact)

### 6. Company Stage Analysis
- Layoffs by funding stage
- Startup vs. established company patterns

### 7. Advanced Analysis
- Top 5 companies by layoffs each year
- Company performance tracking over time
- Ranking companies within each year

## SQL Techniques Demonstrated

### Aggregation Functions
- `SUM()`, `COUNT()`, `MAX()`, `MIN()`
- `GROUP BY` for categorical analysis

### Date Functions
- `YEAR()` for annual grouping
- `SUBSTRING()` for monthly analysis
- Date range queries

### Window Functions
- `DENSE_RANK()` for ranking companies
- `SUM() OVER()` for rolling totals
- `PARTITION BY` for year-wise rankings

### Common Table Expressions (CTEs)
- Multi-step analysis with `WITH` clauses
- Nested CTEs for complex rankings
- Improved query readability

### Advanced Querying
- Subqueries and derived tables
- Multiple levels of aggregation
- Conditional filtering

## Key Insights

### Business Implications

1. **High funding ≠ Guaranteed success**: 115 well-funded companies experienced complete shutdowns, proving funding alone didn't ensure survival
2. **Industry concentration**: Consumer and tech sector layoffs disproportionately high
3. **Geographic concentration**: US tech hubs most severely affected, accounting for majority of global layoffs
4. **Timing patterns**: Clear correlation with economic events (COVID-19 pandemic, tech correction, interest rate changes)
5. **Company lifecycle matters**: Different layoff patterns between startups and established companies

### Interesting Observations

- Some companies had multiple layoff rounds over the 3-year period
- Layoffs accelerated dramatically in 2022-2023 (post-pandemic correction)
- Consumer-facing industries particularly vulnerable to economic downturns
- Geographic spread indicates truly global economic impact despite US dominance
- Peak month (January 2023) suggests year-end decision-making by companies

## Visualizations (Future Work)

Potential visualizations from this analysis:
- Time series plot of monthly layoffs
- Industry comparison bar chart
- Geographic heat map of layoff distribution
- Top 10 companies by total layoffs
- Rolling total line graph showing cumulative impact
- Year-over-year comparison charts

## Project Structure
```
layoffs-exploratory-analysis/
├── README.md                       
├── exploratory_analysis.sql            
└── screenshots/                       
    ├── industry_breakdown.png
    ├── top_companies.png
    └── rolling_total.png
```

## How to Use This Analysis

### Prerequisites
- MySQL or compatible SQL database
- Cleaned layoffs dataset from [data cleaning project](https://github.com/irene-vanessa/data-cleaning-in-sql-layoffs/blob/main/data_cleaning_layoffs.sql)

### Running the Analysis
1. Ensure cleaned data is loaded into table
2. Execute queries sequentially or select specific analyses of interest
3. Each section is clearly labeled and can be run independently
4. Modify filters and limits as needed for deeper analysis

### Customization
- Adjust `LIMIT` values to see more/fewer results
- Change date ranges for specific time period analysis
- Add `WHERE` clauses for industry-specific or company-specific analysis
- Modify ranking thresholds (currently top 5 per year)

## Tools Used
- **Database**: MySQL 
- **Techniques**: Aggregation, Window functions, CTEs, Date manipulation
- **Development**: MySQL Workbench

## Skills Demonstrated

### SQL Proficiency
- Complex aggregations and multi-level grouping
- Window functions for rankings and running totals
- CTEs for readable, maintainable queries
- Date manipulation and temporal analysis
- Subqueries and derived tables

### Analytical Thinking
- Breaking down complex business questions into SQL queries
- Identifying meaningful patterns in data
- Deriving actionable business insights from results
- Structured, systematic approach to data exploration

### Business Analysis
- Translating business questions into technical queries
- Interpreting results in business context
- Identifying actionable insights for stakeholders
- Understanding economic and industry trends

## Next Steps

### Further Analysis
1. Correlation analysis between funding raised and layoff severity
2. Survival analysis of companies over time
3. Predictive modeling for layoff risk factors
4. Detailed geographic analysis by city/region
5. Industry subsector deep-dives

### Visualization
- Create interactive dashboards in Tableau or Power BI
- Build time-series visualizations
- Geographic mapping of layoffs by region
- Industry comparison charts

### Integration
- Combine with external economic indicators (unemployment rates, GDP)
- Add stock price data for public companies
- Incorporate news sentiment analysis

## Related Projects
- [Layoffs Data Cleaning Project](https://github.com/irene-vanessa/data-cleaning-in-sql-layoffs/blob/main/data_cleaning_layoffs.sql) - The data preparation foundation for this analysis

## Lessons Learned

1. **Data quality matters**: Clean, well-structured data makes analysis significantly easier and more reliable
2. **CTEs improve readability**: Complex queries benefit from step-by-step structure using CTEs
3. **Window functions are powerful**: Essential for rankings, running totals, and time-series analysis
4. **Business context is crucial**: Numbers alone don't tell the story - context and interpretation matter
5. **Iterative exploration**: Each query often reveals new questions and deeper analysis opportunities

## Author
**Irene Vanessa Vifah**

Connect with me: [LinkedIn](http://www.linkedin.com/in/irenevanessavifah) | [GitHub](https://github.com/irene-vanessa)

## License
This project is open source and available under the MIT License.

## Acknowledgments
- Dataset sourced from [Kaggle](https://www.kaggle.com/datasets/swaptr/layoffs-2022)
- Inspired by real-world business intelligence practices
- Built on foundational data cleaning work
