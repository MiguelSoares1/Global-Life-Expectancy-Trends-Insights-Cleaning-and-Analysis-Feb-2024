Project World Life Expectancy-MYSQL

# Table of Contents
1. [Project Background](#project-background)
2. [Executive Summary](#executive-summary)
3. [Challenges and Solutions](#Challenges-and-Solutions)
4. [Recommendations](#Recommendations)

## Project Background
Analysis of global life expectancy trends across countries to understand the impact
of economic development (GDP), health factors (BMI), and development status on
life expectancy outcomes between 2007 - 2022.

## Goals and Objectives 
1. Identify countries with the highest and lowest life expectancies.
2. Analyze life expectancy trends over time and by economic status (developing vs.
developed).
3. Explore correlations between GDP, BMI, and life expectancy.
4. Handle data quality issues such as duplicates and missing values to ensure robust
analysis.

## Executive Summary
Analysis of worldwide life expectancy data reveals significant disparities between
developed and developing nations, with a strong correlation between GDP and life
outcomes. Key findings:
* 52.7 year gap between highest and lowest life expectancy countries
* Countries with GDP ≥$1,500 show 9.7 years higher life expectancy
* Developed nations average 12.4 years longer life expectancy than developing
ones
* Adult mortality trends show consistent decline in most regions

![World life expec](https://github.com/user-attachments/assets/0acee083-469e-4a1f-9a9b-9daaab376d23)

### Insights Deep-Dive: Life Expectancy Trends

1. Country-Level Changes (2007-2022)
o Maximum increase: 0.5 years
o Minimum increase: 0.8 years
o Average annual improvement: 0.32 years
2. Economic Impact
o High GDP (≥$1,500): 74.2 years average
o Low GDP (≤$1,500): 64.6 years average
o GDP correlation coefficient: 0.84
3. Development Status Impact
o Developed nations: 79.2 years
o Developing nations: 66.8 years
o Sample size: 32 developed, 161 developing countries

### Health Metrics
1. BMI Correlation
o High BMI countries show Higher life expectancy
o Regional variations significant
o Strongest impact in developing nations
2. Adult Mortality
o Increasing trend across 15 years
o Faster improvement in developing nations
o Significant regional variations

## Key Insights
1. Life Expectancy Trends
- Countries with higher GDP have significantly longer life expectancies.
- Developing nations exhibit greater variability in life expectancy growth over 15
years compared to developed nations.
2. Economic Status Analysis:
- Developed countries have an average life expectancy of 79 Years, while
developing nations average 65 years.
3. BMI and Life Expectancy Correlation:
- Countries with Higher average BMIs tend to have higher life expectancies,
suggesting health and nutrition disparities.

## Recommendations
1. Focus on Health Policies in Developing Nations:
Invest in healthcare infrastructure to address disparities in life expectancy.
2. Target Economic Growth:
Countries with higher GDP exhibit longer life expectancies; policies aimed at
economic development could improve overall health.
3. Address Nutrition and Obesity:
Encourage programs to manage a healthy BMI, as higher BMIs are often linked to higher life expectancy in some populations..

## Challenges and Solutions
Duplicate Records:
* Issue: Multiple records for the same country and year.
* Solution: Identified and removed duplicates using ROW_NUMBER().
Missing Life Expectancy Data:
* Issue: Blank Life_expectancy fields for some countries and years.
* Solution: Used interpolation based on neighboring years&#39; data.
Inconsistent Status Labels:
* Issue: Blank or incorrect status fields for some countries.
* Solution: Updated blank fields using the most frequent status for each country.

