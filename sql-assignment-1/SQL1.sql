-- 1) Display the number of rows in the Patient table
SELECT COUNT(*)
AS PatientCount
FROM Patient;

-- 2) Delete record in provider type

-- BEFORE
SELECT *
FROM ProviderType
WHERE ProviderTypeID = 4;

-- DELETE
DELETE FROM ProviderType
WHERE ProviderTypeId = 4;

-- AFTER
SELECT *
FROM ProviderType
WHERE ProviderTypeID = 4;

-- 3) Two table implied join (Patient, PatientAilment)
SELECT p.PatientID, p.FName, p.LName, pa.AilmentID
FROM Patient p, PatientAilment pa
WHERE p.PatientId = pa.PatientID
AND p.PatientID = 1;

-- 4) Three tables aimplied join (Patient, PatientAilment, Ailment)
SELECT p.FName, p.LName, a.Ailment
FROM Patient p, PatientAilment pa, Ailment a
WHERE p.PatientID = pa.PatientID
AND pa.AilmentID = a.AilmentID
AND p.PatientID = 1;

-- 5) Twelve SQL functions

-- 5.1) Count Patients
SELECT COUNT(*)
AS TotalPatients
FROM Patient;

-- 5.2) Sum of patient heights
SELECT SUM(Height)
AS HeightSum
FROM Patient;

-- 5.3) Average weight
SELECT AVG(Weight)
AS AverageWeight
FROM Patient;

-- 5.4) Oldest Patient
SELECT MIN(DOB)
AS OldestDOB
FROM Patient;

-- 5.5) Youngest Patient
SELECT MAX(DOB)
AS YoungestDOB
FROM Patient;

-- 5.6) Upper Last Name
SELECT UPPER(LName)
AS UpperLastName
FROM Patient;

-- 5.7) Lower First Name
SELECT LOWER(FName)
AS LowerFirstName
FROM Patient;

-- 5.8) Lastname Length
SELECT LEN(LName)
AS NameLength
FROM Patient;

-- 5.9) Current Date
SELECT GETDATE()
AS CurrentDateTime;

-- 5.10) ISNULL
SELECT ISNULL(MName, 'N/A')
AS MiddleName
FROM Patient;

-- 5.11) ABS
SELECT ABS(-100)
AS AbsoluteValue;

-- 5.12) Round
SELECT ROUND(123.456, 2)
AS RoundedValue;

-- 6) LIKE in a WHERE clause: Find patients whose last name starts with 'Le'
SELECT *
FROM Patient
WHERE LName LIKE 'Le%';

-- 7a) Limit to 4 rows
SET ROWCOUNT 4;

SELECT *
FROM Patient;

-- 7b) Reset ROWCOUNT
SET ROWCOUNT 0;

SELECT *
FROM Patient;

-- 7c) Alternative (top)
SELECT TOP 4 *
FROM Patient;

-- 8) Insert values into Ailment table
INSERT INTO Ailment (AilmentID, Ailment)
VALUES (26, 'Pneumonoultramicroscopicsilicovolcanoconiosis');

-- Verify
SELECT *
FROM Ailment
WHERE AilmentID = 26;

-- 9 Update one middle name in Patient Table
UPDATE Patient
SET MName = 'Josh'
WHERE PatientID = 1;

-- 10) Create a new table
CREATE TABLE RIB (
	RouteID INT PRIMARY KEY,
	Destination VARCHAR(50),
	PrefixLength INT,
	NextHop VARCHAR(50),
	AdminDistance INT,
	Protocol VARCHAR(20)
);

-- Clear Existing
TRUNCATE TABLE RIB;

-- Populate with RIB Routes
INSERT INTO RIB VALUES
(1, '10.0.0.0', 8, '192.168.1.1', 10, 'OSPF'),
(2, '10.1.0.0', 16, '192.168.1.2', 20, 'OSPF'),
(3, '172.16.0.0', 12, '192.168.1.3', 5, 'EIGRP'),
(4, '192.168.10.0', 24, '10.0.0.1', 1, 'CONNECTED'),
(5, '192.168.20.0', 24, '10.0.0.2', 2, 'CONNECTED'),
(6, '0.0.0.0', 0, '192.168.1.254', 100, 'STATIC'),
(7, '172.20.0.0', 16, '192.168.1.4', 15, 'RIP'),
(8, '10.2.0.0', 16, '192.168.1.5', 25, 'OSPF'),
(9, '192.168.30.0', 24, '10.0.0.3', 3, 'CONNECTED'),
(10, '203.0.113.0', 24, '193.168.1.6', 200, 'BGP')

-- 11) Insert 2 Ailments for a patient and 3 for another
INSERT INTO PatientAilment VALUES (1, 2);
INSERT INTO PatientAilment VALUES (1, 3);

INSERT INTO PatientAilment VALUES (2, 1);
INSERT INTO PatientAilment VALUES (2, 3);
INSERT INTO PatientAilment VALUES (2, 4);

-- 12) Use Group By with Patient and Ailment table
SELECT p.PatientID, p.FName, COUNT(pa.AilmentID)
AS AilmentCount
FROM Patient p, PatientAilment pa
WHERE p.PatientID = pa.PatientID
GROUP BY p.PatientID, p.FName;

-- 13) Utilize substring command
SELECT LName, SUBSTRING(LName, 1, 3)
AS ShortName
FROM Patient;

-- 14) Use of distinct, ascending, descending
SELECT DISTINCT LName
FROM Patient
ORDER BY LName DESC;

-- 15) @@version
SELECT @@VERSION;

-- 16) Ailments in Ailment table
SELECT COUNT(*)
AS TotalAilments
FROM Ailment;

-- 18) Patient with the most Ailments
SELECT TOP 1 p.PatientID, p.FName, COUNT(pa.AilmentID)
AS AilmentCount
FROM Patient p, PatientAilment pa
WHERE p.PatientID = pa.PatientID
GROUP BY p.PatientID, p.FName
ORDER BY AilmentCount DESC;

-- 19) Provider with logest lastname
SELECT TOP 1 ProviderID, LName, LEN(LName)
AS NameLength
FROM Provider
ORDER BY LEN(LName) DESC;

-- 20a) Create patient
INSERT INTO Patient (PatientID, FName, LName)
VALUES (26, 'Erik', 'Sorensen');

-- 20b) Assign multiple ailments
INSERT INTO PatientAilment VALUES (26, 4);
INSERT INTO PatientAilment VALUES (26, 10);

-- 20c) Display patient and ailments
SELECT p.FName, p.LName, a.Ailment
FROM Patient p, PatientAilment pa, Ailment a
WHERE p.PatientID = pa.PatientID
AND pa.AilmentID = a.AilmentID
AND p.PatientID = 26;