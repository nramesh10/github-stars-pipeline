# GitHub Gems: Driving Open-Source Investments With Data
! [This is the lineage graph generated by dbt for the views in this repo.]
(./docs/dbt_dag.png)

## Important Metrics and Data Points 

This project aims to develop a data pipeline that allows users to gain deeper insight into the open-source ecosystem on 
Github. This way, the users can utilize the pipeline to inform any investment decisions they might try to make. 
The most important metrics that we want to look at with this pipeline are the growth of stars and the growth rate of commits for the repos 
available on GitHub. 

The data points available for this project are all going to be from GH Archive. This is chosen because the data on GH Archive will be 
updated hourly, and will provide ample data for a daily update. 

The data will be delivered in a SQL Database, and updated daily. 

##Models 

There are different types of models available to users that will display 
different fact/dimensional information in an efficient manner. The one we 
plan on using is a Kimball Model. 

### Different Fact and Dimensions Models 
1. Transactional Fact Model 

2. Snapshot Fact Model 
 
3.Slowly Changing Dimension Model  

### The Kimball Model - "Star Schema" 

The Kimball Model is also known as a star schema since it is shaped like a 
star when looking at the structure of the schema. In a Kimball Model, 
there are a couple central fact tables with multiple dimension tables 
branching off each one. 

Here is a list of the fact and dimension models available. 
fact_stars
fact_commits
dim_repositories
dim_users 

### Sample SQL 
When dealing with models such as this one, it's important to have optimal 
SQL queries for the user. In our case, if the user is looking for star 
growth rate or commit growth rate, there are some simple queries to find 
this information within our model. 

```sql 
SELECT month, yoy_star_growth 
FROM repo_stars_growth
where repo_name = "{Insert repo name}" 
``` 

This is a simple sample query for if a user is looking to see year-on-year 
growth of stars of a particular repo. 

```sql
SELECT month, yoy_commit_growth 
FROM repo_commits_growth 
where repo_name = "{Insert repo name}"
```

This is a similar query used to look at commit growths in the same manner. 
