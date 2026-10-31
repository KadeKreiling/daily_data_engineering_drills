Healthcare Star Schema Design

Project Overview

I'm building a healthcare analytics warehouse using SQL Server (T-SQL) as part of my daily data engineering challenges.

The goal is to practice dimensional modeling, SQL development, and building a data warehouse that can support reporting on appointments, providers, clinics, and revenue.

Development Log

Day 1: Provider Dimension and SCD Type 2

For Day 1, I focused on building the provider dimension table using Slowly Changing Dimensions (SCD Type 2) to preserve historical provider information.

I created two tables:

ProviderIdentity: Stores a unique business ID for each provider, along with their original legacy ID and source system.

DimProvider: Stores provider information, including names, specialties, effective dates, and whether a record is currently active.

I connected these tables using a foreign key so each provider has a consistent business ID across multiple historical versions, while each version gets its own surrogate key.

The design supports SCD Type 2 by allowing a provider's previous information to be preserved when something changes, such as their specialty. Instead of overwriting the old information, the intended pipeline will expire the previous record and insert a new version, allowing historical reports to reference the provider's information at that point in time.

I also created a filtered unique index to prevent multiple records for the same provider from being marked as current.

Still to implement:

Add constraints or validation logic to prevent overlapping start and end dates for the same provider.

Add checks to prevent an end date from being earlier than its start date.

Build the ETL logic that automatically expires old records and inserts updated versions.

Test the schema and its constraints against a SQL Server database.