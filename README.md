# Healthcare Operations SQL Analysis

A growing SQL portfolio project analysing synthetic healthcare operations data using T-SQL and Microsoft SQL Server.

## Project Purpose

The project uses a relational healthcare dataset to answer operational and reporting questions involving appointments, patients, clinicians, clinics, referrals and support tickets.

The project will be expanded as I develop more advanced SQL skills.

## Database Structure

The project currently uses a synthetic SQL Server database called `HealthcareTraining`.

The database contains six related tables:

- `patients` – patient demographic and contact information
- `clinics` – clinic names and regions
- `clinicians` – clinicians, specialties and clinic assignments
- `appointments` – appointment dates, types, statuses, booking channels and durations
- `referrals` – referral sources, priorities and statuses
- `support_tickets` – operational support issues and ticket information

The database currently exists locally in Microsoft SQL Server. A reproducible database setup script will be added later in the project as database creation and design skills are developed.

## Current Analysis

The current analysis includes:

- Appointment counts by status
- Booking-channel usage
- Appointment duration analysis
- Completed appointment analysis
- Cancelled and no-show appointment reporting

## SQL Skills Demonstrated

- SELECT
- WHERE
- IN
- ORDER BY
- Aggregate functions
- GROUP BY
- HAVING

## Tools

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL

## Files

### `01_basic_analysis.sql`

Contains the first set of operational analysis queries using filtering, aggregation, grouping and sorting.

## Dataset

All data used in this project is synthetic training data created for learning and portfolio purposes. No real patient or workplace data is included.
