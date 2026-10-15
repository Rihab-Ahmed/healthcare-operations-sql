# Healthcare Operations SQL Analysis

A growing SQL portfolio project analysing synthetic healthcare operations data using T-SQL and Microsoft SQL Server.

## Project Purpose

This project uses a relational healthcare operations dataset to answer realistic reporting and operational questions involving appointments, patients, clinicians, clinics, referrals and support tickets.

The project is being expanded as I develop more advanced SQL skills, with later stages planned to include date analysis, subqueries, CTEs, window functions and data-quality checks.

## Database Structure

The project uses a synthetic SQL Server database called `HealthcareTrainingPortfolio`.

The database contains six related tables:

- `patients` – patient demographic and contact information
- `clinics` – clinic names and regions
- `clinicians` – clinicians, specialties and clinic assignments
- `appointments` – appointment dates, types, statuses, booking channels and durations
- `referrals` – referral sources, priorities and statuses
- `support_tickets` – operational support issues and ticket information

### Main Relationships

- `clinics` → `clinicians`
- `clinicians` → `appointments`
- `patients` → `appointments`
- `patients` → `referrals`
- `patients` → `support_tickets`
- `clinics` → `support_tickets`

Primary and foreign keys are used to maintain relationships between the tables.

## Reproducing the Project

The database can be recreated locally using the included SQL scripts.

Run the files in this order:

1. `00_create_tables.sql`
2. `00_sample_data.sql`
3. `01_basic_analysis.sql`
4. `02_case_analysis.sql`
5. `03_joins.sql`

`00_create_tables.sql` creates the `HealthcareTrainingPortfolio` database and its tables.

`00_sample_data.sql` loads synthetic healthcare operations data for analysis.

## Analysis Completed

The project currently includes analysis such as:

- Appointment counts by status
- Booking-channel usage
- Appointment duration analysis
- Completed appointment reporting
- Cancelled and no-show reporting
- Appointment classification using `CASE`
- Referral priority and status classification
- Appointment counts by duration category
- Patient, appointment and clinician reporting using joins
- Multi-table joins including clinic information
- Identification of patients with no appointments
- Identification of clinics with no clinicians
- Identification of clinicians with no appointments
- Appointment counts by clinic

## SQL Skills Demonstrated

- `SELECT`
- `WHERE`
- `IN`
- `ORDER BY`
- Aggregate functions
- `GROUP BY`
- `HAVING`
- `CASE`
- `INNER JOIN`
- `LEFT JOIN`
- Multi-table joins
- Primary and foreign key relationships
- Identifying unmatched records using `LEFT JOIN` and `IS NULL`
- Combining joins with aggregation

## Tools

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- GitHub

## Project Files

### `00_create_tables.sql`

Creates the portfolio database, tables, primary keys and foreign-key relationships.

### `00_sample_data.sql`

Populates the database with synthetic data designed to support realistic SQL analysis.

### `01_basic_analysis.sql`

Contains the first set of operational analysis queries using filtering, aggregation, grouping and sorting.

### `02_case_analysis.sql`

Uses `CASE` expressions to classify appointment durations, appointment outcomes and referral categories.

### `03_joins.sql`

Uses `INNER JOIN`, `LEFT JOIN` and multi-table joins to analyse relationships between patients, appointments, clinicians and clinics, including unmatched-record analysis.

## Dataset

All data used in this project is synthetic training data created specifically for learning and portfolio purposes.

No real patient, NHS or workplace data is included.
