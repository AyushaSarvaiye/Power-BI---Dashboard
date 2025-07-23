create database hosp_insights;
use hosp_insights;

select * from hosp1;
select * from hosp2;

DESCRIBE hosp1;
DESCRIBE hosp2;

#Join Two Tables hosp1 & hosp2
SELECT *
FROM hosp1
INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID;

#Total Patients Treated
SELECT COUNT(DISTINCT hosp1.PatientID) 
FROM hosp1
INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID; ;
#Total Revenue

SELECT SUM(TotalCost)
FROM hosp1
INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID;

#OR

SELECT ROUND(SUM(TotalCost) / 1000000) AS TotalRevenue_Millions
FROM hosp1
INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID;

#AVG Cost Per Patient
SELECT 
    ROUND(SUM(TotalCost) / COUNT(DISTINCT hosp1.PatientID ), 2) AS AvgCostPerPatient
FROM hosp1
INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID;

#AVG Length OF Stay
SELECT ROUND(AVG(LengthOfStay)) AS AvgLengthOfStay
FROM hosp1
INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID;

#Recovery Rate Overall
SELECT 
    ROUND(
        100.0 * COUNT(CASE WHEN `Recovery Status` = 'Recovered' THEN 1 END) / COUNT(*),
        2
    ) AS RecoveryRatePercentage
FROM hosp1
INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID;

#All Patient Names
SELECT PatientName
FROM 
hosp1
INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
ORDER BY PatientName ASC;

#All Hospital Names
SELECT HospitalName
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY HospitalName
ORDER BY HospitalName ASC;

#Patient Count By Age Group :
SELECT PateintGroupAge , COUNT(DISTINCT hosp1.PatientID) AS PatientCount
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY PateintGroupAge
ORDER BY PateintGroupAge ASC;


#Patient count by hospital:
SELECT HospitalName, COUNT(DISTINCT hosp1.PatientID) AS PatientCount
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY HospitalName
ORDER BY PatientCount DESC;


#Treatment Distribution By Patient Name:
SELECT 
   Treatment ,
    COUNT(hosp1.PatientID) AS treatment_count
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY Treatment;

#Total Revenure By Month :
SELECT 
    DATE_FORMAT(AdmissionDate, '%Y-%m') AS YearMonth,
    SUM(TotalCost) AS TotalRevenue
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY YearMonth
ORDER BY YearMonth ASC;

SELECT 
    monthname(MonthYear) AS MonthName,
    SUM(TotalCost) AS TotalRevenue
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY MonthName;


#Diagnosis By Patient Count:
SELECT 
    Diagnosis, 
    COUNT(DISTINCT hosp1.PatientID) AS PatientCount
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY Diagnosis
ORDER BY PatientCount DESC;

#Count Of Patients By Recovery Status :
SELECT 
    RecoveryStatus,
    COUNT(DISTINCT hosp1.PatientID ) AS PatientCount
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY RecoveryStatus
ORDER BY PatientCount DESC;

#Blood Group By Patient Count :
SELECT 
    bloodgroup,
    COUNT(hosp1.PatientID ) AS patient_count
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY bloodgroup
ORDER BY patient_count DESC;

#Count Of Patients Treated By Each Doctor  :
SELECT 
    DoctorName, 
    COUNT(DISTINCT hosp1.PatientID ) AS PatientCount
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY DoctorName
ORDER BY PatientCount DESC;

#Total Revenue By Treatment :
SELECT 
    Treatment,
    SUM(TotalCost) AS TotalRevenue
FROM hosp1 INNER JOIN hosp2
ON hosp1.PatientID = hosp2.PatientID
GROUP BY Treatment
ORDER BY TotalRevenue DESC;







