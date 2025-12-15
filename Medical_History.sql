# using the database 
use project_medical_data_history;

# Retrieve everything in table admissions
select * from admissions;

# Retrieve everything in table doctors
select * from doctors;

# Retrieve everything in table patients
select * from patients;

# Retrieve everything in table province_names
select * from province_names;

# 1. show first anme, last name, and gender of patients who's gender is 'M'
SELECT 
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS Full_name,
    gender
FROM
    patients
WHERE
    gender = 'M';
    
# 2. show first name and last name of patients who doesnot have allergies
SELECT 
    first_name, last_name, allergies
FROM
    patients
WHERE
    allergies IS NULL;

# 3. show first name of patients that start with the letter 'C'
SELECT 
    first_name
FROM
    patients
WHERE
    first_name LIKE 'C%';

# 4. show first name and last name of patients that weight within the range of 100 to 120(inclusive)
SELECT 
    first_name, last_name, weight
FROM
    patients
WHERE
    weight BETWEEN 100 AND 120;
    
# 5. Update the patients table for the allergies column. If the patient's allergies is null then replace with "NKA" ( unable to do this as there is no admin permission to update this table)
UPDATE patients 
SET 
    allergies = 'NKA'
WHERE
    allergies IS NULL;

# 6. Show first name and last name concatenated into one column to show their full
SELECT 
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS Full_name
FROM
    patients;
    
#. 7. Show first name, last name and the full province name of each patient
SELECT 
    p.first_name, p.last_name, pn.province_name
FROM
    patients p
        JOIN
    province_names pn ON p.province_id = pn.province_id;
    
# 8. Show how many patients have a birth date with 2010 as the birth year
SELECT 
    COUNT(patient_id) AS Count_of_patients_born_in_2010
FROM
    patients
WHERE
    YEAR(birth_date) = 2010;

# 9. Show the first name, last name and height of the patient with greatest height
SELECT 
    first_name, last_name, height
FROM
    patients
ORDER BY height DESC
LIMIT 1;

# 10. Show all columns for patients who have one of the following patient ids: 1, 45, 534, 879, 1000
SELECT 
    *
FROM
    patients
WHERE
    patient_id IN (1 , 45, 534, 879, 1000); 

# 11. Show the total number of admissions
SELECT 
    COUNT(*) AS Total_admissions
FROM
    admissions;

# 12. Show all the columns from admissions where the patient was admitted and discharged on the same day
SELECT 
    *
FROM
    admissions
WHERE
    admission_date = discharge_date;

# 13. Show the total number of admission for patient_id = 579
SELECT 
    COUNT(patient_id)
FROM
    admissions
WHERE
    patient_id = 579;

# 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'
SELECT DISTINCT
    (city) AS unique_cities_in_NS, province_id
FROM
    patients
WHERE
    province_id = 'NS';

# 15. Write a query to find the first name, last name and birth date of patients who have height more than 160 and weight more than 70
SELECT 
    first_name, last_name, birth_date, height, weight
FROM
    patients
WHERE
    height > 160 AND weight > 70;

# 16. Show unique birth years from patients and order them by ascending
SELECT DISTINCT
    (YEAR(birth_date)) AS Unique_Birth_Years
FROM
    patients
ORDER BY YEAR(birth_date) ASC;

# 17. Show Unique first names from the patients table which only occurs once in the list
SELECT 
    first_name AS Unique_first_names
FROM
    patients
GROUP BY first_name
HAVING COUNT(*) = 1
ORDER BY first_name;

# 18. show patient id and first name from patients where their first name start and end with s and is at least 6 characters long
SELECT 
    patient_id, first_name
FROM
    patients
WHERE
    first_name LIKE 's%s'
        AND LENGTH(first_name) >= 6
ORDER BY patient_id;

#19. show patient id, first name, last name, from patients whose diagnosis is 'Dementia' Primary diagnosis is stored in the admissions table
SELECT 
    p.patient_id, p.first_name, p.last_name, ad.diagnosis
FROM
    patients p
        JOIN
    admissions ad ON p.patient_id = ad.patient_id
WHERE
    ad.diagnosis = 'Dementia'; 
    
# 20. Display every patients's first name Order the list by the length of each name and then by alphabetically 
SELECT 
    first_name
FROM
    patients
ORDER BY LENGTH(first_name) , first_name ASC;

# 21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row
SELECT 
    COUNT(CASE
        WHEN gender = 'M' THEN 1
    END) AS Count_of_Male_patients,
    COUNT(CASE
        WHEN gender = 'F' THEN 1
    END) AS Count_of_Female_patients
FROM
    patients;
    
# 22. Show the total amount of male patients and the total amount of female patients in the patients table
SELECT 
    COUNT(CASE
        WHEN gender = 'M' THEN 1
    END) AS Count_of_Male_Patients,
    COUNT(CASE
        WHEN gender = 'F' THEN 1
    END) AS Count_of_Female_Patients
FROM
    patients;
    
# 23. Show patient id, diagnosis from admissions Find patients admitted multiple times for the same diagnosis
SELECT 
    patient_id, diagnosis
FROM
    admissions
GROUP BY patient_id , diagnosis
HAVING COUNT(*) > 1;

# 24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
SELECT 
    city, COUNT(*) AS Total_patients
FROM
    patients
GROUP BY city
ORDER BY Total_patients DESC , city ASC;

# 25. Show first name, last name and role of every person that is either patient or doctor. The roles are either "patient" or "doctor"
SELECT 
    first_name, last_name, 'Doctor' AS Role
FROM
    doctors 
UNION ALL SELECT 
    first_name, last_name, 'Patient' AS Role
FROM
    patients;
    
# 26. show all allergies ordered by popularity. remove Null values from query
SELECT 
    allergies, COUNT(allergies) AS Allergies_by_popularity
FROM
    patients
WHERE
    allergies IS NOT NULL
GROUP BY allergies
ORDER BY Allergies_by_popularity DESC;

# 27. show all patient's first anme, last name, and birth date who were born in the 1970s decade. sort the list starting from the earliest birth_date
SELECT 
    first_name, last_name, birth_date
FROM
    patients
WHERE
    YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date;

# 28. We want to display each patient's full name in a single column. Their last name in all upper letters must appear first, then first name in all lower case letters. seperate the last name and first name with a comma. Order the list by the first name in decending order EX: SMITH,jane
SELECT 
    CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS Full_name
FROM
    patients
ORDER BY LOWER(first_name) DESC;

# 29. show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
SELECT 
    province_id, SUM(height) AS Sum_of_height
FROM
    patients
GROUP BY province_id
HAVING SUM(height) >= 7000;

# 30. show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
SELECT 
    MAX(weight) - MIN(weight) AS Weight_difference
FROM
    patients
WHERE
    last_name = 'Maroni';

# 31. Show all of the days of the month(1-31) and how many admissions_dates occurred on that day. sort by the day with most admissions to least admissions.
SELECT 
    DAY(admission_date) AS Day_of_month,
    COUNT(*) AS Number_of_admissions
FROM
    admissions
GROUP BY DAY(admission_date)
ORDER BY Number_of_admissions DESC;

# 32. Show all of the patients grouped into weight groups. Show the total amount of patients in each weight group. Order the list by the weight of group decending, eg. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group etc.
SELECT 
    weight_range, COUNT(*) AS total_patients
FROM
    (SELECT 
        CONCAT(FLOOR(weight / 10) * 10, ' to', FLOOR(weight / 10) * 10 + 9) AS weight_range
    FROM
        patients
    WHERE
        weight IS NOT NULL) AS t
GROUP BY weight_range
ORDER BY CAST(SUBSTRING_INDEX(weight_range, ' ', 1) AS UNSIGNED) DESC;

# 33. show patient id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defiend as weight(kg) / height(m). Weight is in units kg. Height is in units cm.
SELECT 
    patient_id,
    weight,
    height,
    CASE
        WHEN weight / ((height / 100.0) * (height / 100.0)) >= 30 THEN 1
        ELSE 0
    END AS isobese
FROM
    patients;
    
# 34. show patient_id, first_name, last_name, and attending doctor's speicality. show only the patients who has diagonis as 'Epilepsy' and the doctor's first name is 'Lisa'. check patients, admissions, and doctors table for required information.
SELECT 
    p.patient_id, p.first_name, p.last_name, d.specialty
FROM
    patients as p
        JOIN
    admissions as a ON p.patient_id = a.patient_id
        JOIN
    doctors as d ON a.attending_doctor_id = d.doctor_id
WHERE
    a.diagnosis = 'Epilepsy'
        AND d.first_name = 'Lisa';
        
        
        
        
        