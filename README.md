# Database Management Portfolio

**Student:** Erik Sorensen  
**Course:** Database Design  
**Platform:** Microsoft SQL Server / T-SQL  

---

## Overview

This portfolio contains projects and assignments completed throughout my Database Management course. It demonstrates applied skills in relational database design, T-SQL programming, security policy, backup and recovery planning, and multi-database architecture — all implemented on Microsoft SQL Server.

---

## Skills & Technologies

- **Platform:** Microsoft SQL Server (SQL Server Express)
- **Tools:** SQL Server Management Studio (SSMS)
- **Language:** T-SQL (Transact-SQL)
- **Concepts:** Relational schema design, normalization (3NF), stored procedures, views, functions, error handling, indexing, backup/recovery, role-based security, cross-database queries

---

## Projects & Assignments

---

### Project 1 — Sick DB: Healthcare Database Design & Population

A fully normalized relational database modeling a healthcare environment with patients, providers, ailments, and diagnoses.

**Schema:** Five tables — `Patient`, `Ailment`, `Provider`, `ProviderType`, and `PatientAilment` — structured to Third Normal Form. The `PatientAilment` junction table resolves the many-to-many relationship between patients and ailments, with temporal tracking via `StartDate` and `EndDate` columns.

**Key Work:**
- Designed the entity-relationship diagram and data dictionary
- Created all tables with primary keys, foreign keys, and defined nullability
- Populated the database using a populate script; resolved foreign key constraint conflicts during initial insertion by temporarily removing relationships
- Verified row counts with aliased `SELECT COUNT(*)` queries across all tables (25 patients, 25 providers, 47 PatientAilment records)
- Established naming standards: PascalCase for tables and columns, `<TableName>ID` format for primary keys

**Files:** `SickDBProject_ErikSorensen.pdf`, `InstallAndPopulate_ErikSorensen.pdf`

---

### Project 2 — Meijer Retail Database Design & SQL Queries

A retail operations database modeling the full lifecycle of a customer transaction for a mid-scale retailer.

**Schema:** Eight tables — `Customer`, `Store`, `Product`, `Category`, `Supplier`, `StoreProduct`, `Purchase`, and `PurchaseDetail` — following Third Normal Form. The schema uses a classic retail star pattern with two bridging tables and enforced referential integrity throughout (500 customers, 25 stores, 100 products, 20 purchases, 41 line items).

**Key Work:**
- Designed and documented the full ER diagram and schema narrative
- Verified table population using `UNION ALL` count queries
- Wrote queries covering multi-table joins, views, `GROUP BY`, `DISTINCT`, `ASC`/`DESC` sorting
- Demonstrated inner, left outer, and right outer joins
- Applied five T-SQL functions: `LEN()`, `UPPER()`, `LOWER()`, `GETDATE()`, `ISNULL()`
- Created a stored procedure (`spu_InsertProviderType`) with parameterized input
- Wrote manual `CREATE TABLE` with a clustered primary key and a named index

**Files:** `DatabaseDesign_ErikSorensen.pdf`, `database2.pdf`, `database2.sql`

---

### Project 3 — SQL Assignment 1: Foundational Queries & Data Manipulation

Foundational T-SQL work on the Sick DB database covering core query techniques, data manipulation, and built-in functions.

**Key Work:**
- Counted rows in the `Patient` table using `SELECT COUNT(*)`
- Demonstrated a DELETE with before/after verification on `ProviderType`
- Wrote a two-table implied join (`Patient`, `PatientAilment`) filtered to a specific patient
- Wrote a three-table implied join (`Patient`, `PatientAilment`, `Ailment`) to retrieve patient diagnoses
- Applied twelve T-SQL functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`, `UPPER()`, `LOWER()`, `LEN()`, `GETDATE()`, `ISNULL()`, `ABS()`, `ROUND()`
- Used `LIKE` in a `WHERE` clause to find patients by last name pattern (`'Le%'`)
- Demonstrated row limiting via `SET ROWCOUNT`, reset with `SET ROWCOUNT 0`, and `SELECT TOP`
- Inserted a new record into `Ailment` and verified with a `SELECT`
- Updated a patient's middle name with `UPDATE ... SET`
- Created a custom `RIB` (Routing Information Base) table and populated it with 10 network routing entries across protocols: OSPF, EIGRP, RIP, BGP, STATIC, and CONNECTED
- Inserted multiple `PatientAilment` records (2 ailments for one patient, 3 for another)
- Used `GROUP BY` to count ailments per patient
- Used `SUBSTRING()` to extract the first 3 characters of a last name
- Demonstrated `DISTINCT` with `ORDER BY DESC`
- Queried `@@VERSION` to retrieve SQL Server version info
- Found the patient with the most ailments using `TOP 1` with `GROUP BY` and `ORDER BY`
- Found the provider with the longest last name using `TOP 1` with `LEN()` and `ORDER BY`
- Inserted himself (Erik Sorensen, PatientID 26) with two assigned ailments, then displayed them via a three-table join

**Files:** `SQL1.sql`

---

### Project 4 — SQL Assignment 2: Queries, Views, Functions & Stored Procedures

Intermediate T-SQL work on the Sick DB database covering data retrieval, multi-table joins, built-in functions, views, stored procedures, and aggregation.

**Key Work:**
- Counted rows in a table using `SELECT COUNT(*) AS PTIDCnt`
- Deleted specific records by ID and verified deletion with a follow-up `SELECT`
- Created a two-table view (`vw_GetProviderAndType`) joining `Provider` and `ProviderType`, then queried it
- Wrote a three-table join using the view alongside `PatientAilment` and `Ailment` tables
- Applied five T-SQL functions: `LEN()`, `UPPER()`, `LOWER()`, `GETDATE()`, `ISNULL()`
- Created a stored procedure (`spu_InsertProviderType`) with parameters and executed it
- Manually wrote `CREATE TABLE Student` with a clustered primary key and index
- Wrote a `GROUP BY` query counting patients per provider, ordered by count descending
- Demonstrated `DISTINCT`, `ASC`, and `DESC` sorting (7+ row result set)
- Demonstrated inner join, left outer join, and right outer join

**Files:** `SQL2.pdf`

---

### Project 5 — SQL Assignment 3: DDL, Routines & Error Handling

Advanced T-SQL work focused on Data Definition Language, control flow, error handling, and data integrity.

**Key Work:**
- Created `Customer2` table with an `IDENTITY` primary key, named index (`NameIDX`), and inserted 50 unique rows of customer data
- Demonstrated `TRUNCATE` and `DROP` table operations with verification
- Built a view (`vw_Customer2`) and queried it with `ORDER BY`
- Implemented `IF`, `ELSE IF`, and `CASE` control flow routines
- Used `ALTER TABLE` to add a `TINYINT` column to an existing table
- Built a stored procedure (`sp_UpdateCustomerPhone`) with `BEGIN TRY / BEGIN CATCH` error handling and error logging to an `ErrorAudit` table
- Used T-SQL variables with `DECLARE` for parameterized queries
- Created a `Cars` table using a `WHILE` loop to insert 10 rows programmatically
- Designed `HikingLocations` with `IGNORE_DUP_KEY` and identified duplicates using `GROUP BY HAVING COUNT(*) > 1` and subqueries
- Wrote an insert routine with full `TRY/CATCH` error handling

**Files:** `SQL3.pdf`

---

### Project 6 — SQL Assignment 4: Cross-Database Insurance Rating System

A two-database system that calculates insurance rates based on customer age and gender, with rider surcharge logic and reporting.

**Schema:** `RateDB` holds a `Rate` table with age band ranges and gender-specific rates (populated in 5-year increments from age 0–99). `CustomerDB` holds a `Customer` table with 40 customers across a wide age range, including a `Rider` bit flag column.

**Key Work:**
- Created and populated two separate SQL Server databases (`RateDB`, `CustomerDB`)
- Wrote a scalar function (`dbo.GetInsuranceRate`) computing current age from DOB using `DATEDIFF` with birthday-adjustment logic, then performing a cross-database rate band lookup
- Built `dbo.ApplyRider` stored procedure to assign rider flags to 10 customers and display base rate vs. final rate (1.5x rider multiplier)
- Built `dbo.CustomerRateReport` stored procedure generating a full customer report sorted by age range, last name, and first name — including applied rate and rate type label
- Executed both procedures and validated output

**Files:** `SQL4.pdf`

---

### Project 7 — Database Recovery Plan

A comprehensive disaster recovery policy for an organization with 1,500 employees and $250M in annual revenue running Microsoft SQL Server on-premises.

**Key Work:**
- Defined Recovery Time Objectives (RTO) and Recovery Point Objectives (RPO) for five systems: Order Entry (2hr RTO / 15min RPO), Accounting (4hr / 15min), HR Cloud (8hr / 24hr), Planning (12hr / 1hr), Data Warehouse (24hr / 24hr)
- Designed a full/differential/transaction log backup schedule with retention policies (30-day daily, 12-month monthly, 7-year archive)
- Implemented the 3-2-1 backup rule: RAID 10 primary, NAS secondary, Azure offsite — with AES-256 encryption and TLS 1.2 in transit
- Defined a four-level escalation path (On-call DBA → Senior DBA → Infrastructure Director → Vendor Support)
- Documented step-by-step on-premises recovery and cloud HR vendor recovery procedures
- Established a change control policy distinguishing simple vs. complex changes, with rollback plans and approval gates
- Included T-SQL scripts for session monitoring, session termination, database backup, and restore with `REPLACE` and `RECOVERY`
- Defined DBA turnover procedure: immediate access revocation, credential rotation, and knowledge transfer

**Files:** `DatabaseRecovery`

---

### Project 8 — Database Security Policy

A defense-in-depth security policy covering physical, network, host, and database security layers for the same enterprise environment.

**Key Work:**
- Defined multi-tier architecture (Web → Application → Database) with database servers isolated from the internet
- Applied layered controls: physical data center access, network segmentation, TLS encryption, VPN with MFA for admin access, and IDS/IPS monitoring
- Enforced role-based access control (DBA, Developer, Analyst, Read-only) with least-privilege principles and quarterly access reviews
- Required stored procedures and parameterized queries for all application access to prevent SQL injection
- Implemented Data Activity Monitoring (DAM) and Data Loss Prevention (DLP)
- Defined audit logging requirements: login attempts, privilege changes, schema modifications, and sensitive data access — retained for a minimum of one year
- Addressed insider threat controls: segregation of duties, mandatory security training, and time-limited temporary access
- Included an AI and cybersecurity risk summary covering data poisoning, model bias, and privacy concerns

**Files:** `SecurityPolicy.pdf`

---

## Repository Structure

```
database-portfolio/
├── sick-db/
│   ├── SickDBProject_ErikSorensen.pdf
│   └── InstallAndPopulate_ErikSorensen.pdf
├── meijer-db/
│   ├── DatabaseDesign_ErikSorensen.pdf
│   ├── database2.pdf
│   └── database2.sql
├── sql-assignment-1/
│   └── SQL1.sql
├── sql-assignment-2/
│   └── SQL2.pdf
├── sql-assignment-3/
│   └── SQL3.pdf
├── sql-assignment-4/
│   └── SQL4.pdf
├── recovery-plan/
│   └── DatabaseRecovery
├── security-policy/
│   └── SecurityPolicy.pdf
└── README.md
```

---

## How to Run

1. Install [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms).
2. Connect to a local or remote SQL Server instance.
3. For each project, open the `.sql` file (where provided) or reference the PDF for the full script.
4. Run schema/table creation scripts before data population scripts.
5. For SQL Assignment 4, create `RateDB` and `CustomerDB` before executing any functions or procedures.

---

## Contact

**Name:** Erik Sorensen  
**Email:** your.email@example.com  
**LinkedIn:** [linkedin.com/in/yourprofile](https://linkedin.com/in/yourprofile)  
**GitHub:** [github.com/yourusername](https://github.com/yourusername)
