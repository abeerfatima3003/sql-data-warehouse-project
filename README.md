# Data Warehouse And Analytics Project

📬 Welcome to the **Data Warehouse And Analytics Project** repository!

This project presents a complete data warehousing and analytics solution, covering the process from data ingestion and modeling to delivering actionable insights. It is designed to showcase best practices in data engineering and analytics, highlighting capabilities in building scalable, reliable, and insightful data systems.

___________________________________________________

🎥 **Project Overview**
---
1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver** and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytical & Reporting**: Creating SQL-based reports and dashboards for actionable insights.

🏷️ This repository is an excellent resource for professionals and students looking to showcase expertise in:
- SQL Development
- Data Architect
- Data Engineering
- ETL Pipeline Developer
- Data Modeling
- Data Analytics
___________________________________________

🛠️ **Important Links & Tools**:
---
- [Datasets](https://github.com/abeerfatima3003/sql-data-warehouse-project/tree/main/datasets): Access to the project dataset (CSV Files).
- [SQL Server Express](https://learn.microsoft.com/sql/sql-server/express/): Lightweight server for hosting your SQL database.
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/sql/ssms/): GUI for managing and interacting with databases.
- [Git Repository](https://github.com): Set up a GitHub account and repository to manage, version, and collaborate on your code efficiently.
- [DrawIO](https://app.diagrams.net/): Design data architecture, models, flows, and diagrams.
- [Notion](https://www.notion.so/): All-in-one tool for project management and organization.
- [Notion Project Steps](https://www.notion.so/SQL-DATA-WAREHOUSE-PROJECT-24a9d788a32a80548d19c7ac8c9e0ab3?source=copy_link): Access to All Project Phases and Tasks.
________________________________________________________

📌 **Project Requirements**
---

**Building the Data Warehouse (Data Engineering)**

**Objective**

Create a modern data warehouse in SQL Server to combine sales data and support reporting and decision-making.

**Key Points**

- **Data Sources**: Import sales data from ERP and CRM (CSV files).
- **Data Quality**: Clean and fix any data issues.
- **Integration**: Merge both sources into one easy-to-use data model.
- **Scope**: Use only the latest datasets (No historization needed).
- **Documentation**: Provide clear data model documentation for business and analytics teams.
____________________________________________

📊 **BI Analytics and Reporting (Data Analytics)**
---

**Objective**

Build SQL-based analytics to provide insights into:

- **Customer behavior**
- **Product performance**
- **Sales trends**

These insights help stakeholders track key metrics and make better business decisions.
___________________________________

🏗️ **Data Architecture**
---
The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, **Gold** Layers:

![Data Architecture](https://github.com/abeerfatima3003/sql-data-warehouse-project/raw/main/docs/data_architecture.png)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleaning, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a **Star Schema** required for reporting and analytics.
___________________________________

🗃️ **Repository Structure**
---
``` 
data-warehouse-project/
|
├── datasets/             # Raw datasets used for the project (ERP and CRM data)
|
├── docs/                 # Project documentation and architecture details
│   ├── etl.drawio        # Draw.io file shows all different techniques and methods of ETL
│   ├── data_architecture.drawio # Draw.io file shows the project's architecture
│   ├── data_catalog.md   # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio  # Draw.io file for the data flow diagram
│   ├── data_models.drawio # Draw.io file for data models (star schema)
│   └── naming-conventions.md # Consistent naming guidelines for tables, columns, and files
|
├── scripts/              # SQL scripts for ETL and transformations
│   ├── bronze/           # Scripts for extracting and loading raw data
│   ├── silver/           # Scripts for cleaning and transforming data
│   └── gold/             # Scripts for creating analytical models
|
├── tests/                # Test scripts and quality files
|
├── README.md             # Project overview and instructions
├── LICENSE               # License information for the repository
├── .gitignore            # Files and directories to be ignored by Git
└── requirements.txt      # Dependencies and requirements for the project
```
___________________________________

📜 **License**
---
This project is licensed under the MIT License. You can use, modify, and share this project with proper credit.
 __________________________________

💁🏻‍♀️ **About Me**
---

Hi there! I'm **Syeda Abeer Fatima**. A data enthusiast focused on creating efficient data solutions. This project was a great opportunity to apply my skills in data warehousing, ETL development, and data modeling. I love learning new things, reading books, and finding simple solutions to complex problems.

Feel free to connect with me. I would love to hear your thoughts. Let's stay in touch! 

[Connect with me on LinkedIn](http://www.linkedin.com/in/abeer3003)

