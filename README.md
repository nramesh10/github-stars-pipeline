# GitHub Gems: Driving Open-Source Investments With Data

Welcome to the GitHub Gems project! This project hosts a data analytics pipeline that enables smarter investment decisions by measuring the popularity of open-source repos on Github.

## Project Overview

The goal of this project is to develop an efficient data pipeline that streamlines analytics, reduces manual effort, and enables deeper insights into the open-source ecosystem on GitHub. By leveraging modern data tools and best practices, such as dbt (data build tool) and Airflow, we aim to create a scalable and reliable solution for data-driven decision-making.

## Getting Started

To get started with the GitHub Gems project, follow these steps (click on the
links for guides):

### Set up your IDE

> ℹ️ Skip some steps if you're already set!
>
> If you already have git, VSCode, and/or Python installed, just skip the corresponding step(s).

1. If you don't already use git, [install it here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

2. If you don't have a coding editor installed, [install VSCode](https://code.visualstudio.com/download). After that, [install the Python and Python extension](https://code.visualstudio.com/docs/languages/python#_install-python-and-the-python-extension).

3. Make sure you have Python 3 installed (or [install it here](https://www.python.org/downloads/)).

### Create your personal repo

1. [Create a new repo](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository) in your Github account and name it `github-stars-pipeline`.

2. Clone this repo.

```bash
git clone https://github.com/edsioufi/github-stars-pipeline.git
```


3. Point your local clone to your own remote (so that you can modify your copy of the repo, not the template). Make sure you repalce `{your_github_username}` with the corresponding value.

```bash
cd github-stars-pipeline
git remote set-url origin https://github.com/{your_github_username}/github-stars-pipeline.git
```

4. Push to your new github repo.

```bash
git push origin master
```

### Set up your python environment and DuckDB

1. Create a python virtual environment for your repo:

```bash
python -m venv venv
source venv/bin/activate
```

2. [Install DuckDB](https://duckdb.org/docs/installation/?version=stable&environment=python) (make sure you select the Python option), your first python dependency.

> ℹ️ You might have to install additional dependencies if you're on Windows.

3. [Install DBeaver](https://duckdb.org/docs/guides/sql_editors/dbeaver.html) to explore DuckDB.

4. Create a new git branch:
```bash
git checkout -b add_duck_db
```

5. Add your newly installed packages to your requirements file:
```bash
pip freeze > requirements.txt
```

6. Commit and push:
```bash
git add --all
git commit
git push origin -u add_duck_db
```

7. [Create a Pull Request (PR)](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request#creating-the-pull-request) in Github.

8. [Merge your first 
PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/merging-a-pull-request#merging-a-pull-request). 

## Important Metrics and Data Points Available - Workshop 2  

In this week's workshop, we discussed potential metrics that a user might request to see on the pipeline, through a mock interview with 
Alex, a senior analyst at X company. 

The most important metrics that we want to look at with this pipeline are the growth of stars and the growth rate of commits for the repos 
available on GitHub. 

The data points available for this project are all going to be from GH Archive. This is chosen because the data on GH Archive will be 
updated hourly, which is more than enough for Alex's daily update requirement. 

The data will be delivered in a SQL Database, and updated daily. 
