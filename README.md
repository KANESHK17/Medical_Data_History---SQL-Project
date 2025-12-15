# 🏥 Medical History Data Analysis (PRSQL-02)

A comprehensive **SQL-based data analysis project** focused on extracting insights from medical history data using real-world relational database concepts. This project demonstrates strong hands-on experience in **query design, data validation, joins, aggregations, and analytical reasoning**.

---

## 📌 Project Summary

- **Project Name:** Medical History Data Analysis  
- **Project ID:** PRSQL-02  
- **Team ID:** PTID-CDA-NOV-25-826  
- **Domain:** Healthcare Data Analytics  
- **Database:** MySQL  

The goal of this project is to analyze patient demographics, admission records, doctor specializations, and geographic distribution using structured SQL queries.

---

## 🎯 Project Objectives

- Analyze patient demographics and medical history
- Identify admission trends and diagnosis patterns
- Perform multi-table relational analysis using JOINs
- Apply data cleaning and quality checks
- Derive health indicators such as BMI and weight groups
- Strengthen real-world SQL querying skills

---

## 🗂 Database Schema Overview

The database consists of **four interrelated tables**:

| Table Name        | Description |
|------------------|-------------|
| `patients`        | Patient demographic and health details |
| `admissions`      | Admission records and diagnoses |
| `doctors`         | Doctor details and specialties |
| `province_names`  | Province reference data |

### 🔗 Key Relationships
- `patients.patient_id` → `admissions.patient_id`
- `patients.province_id` → `province_names.province_id`
- `admissions.attending_doctor_id` → `doctors.doctor_id`

---

## 🔍 Data Inspection & Validation

- Verified table structure and schema using `SELECT *`
- Checked column data types and foreign key relationships
- Identified NULL and missing values that could impact analysis
- Ensured schema readiness before executing analytical queries

---

## 🧹 Data Cleaning & Quality Checks

- Identified patients with missing allergy information
- Attempted to standardize NULL values using `"NKA"`
- Highlighted UPDATE permission constraints
- Emphasized the importance of preprocessing before analytics

---

## 🔗 SQL Operations Covered

A total of **34 SQL queries** were executed, covering the following areas:

### ✔ Basic Data Retrieval
- Gender-based filtering
- Name pattern matching
- Range-based conditions (weight, height)

### ✔ Join Operations
- Patients ↔ Provinces
- Patients ↔ Admissions
- Admissions ↔ Doctors

### ✔ Aggregations & Grouping
- Patient counts by gender, city, and birth year
- Repeated admissions for the same diagnosis
- Allergy frequency analysis

### ✔ Text & Formatting
- Full name generation using `CONCAT`
- Case formatting using `UPPER()` and `LOWER()`
- Sorting by name length and alphabetical order

### ✔ Date & Time Analytics
- Admissions by day of the month
- Patients born in specific decades

### ✔ Derived Metrics
- BMI calculation and obesity flag
- Weight group classification
- Province-wise total height aggregation

---

## 📊 Key Insights Generated

- Demographic distribution by gender and birth year
- Admission frequency and diagnosis repetition patterns
- Geographic patient distribution by province
- Identification of obese vs non-obese patients using BMI
- Doctor–patient analysis (e.g., Epilepsy cases treated by specific doctors)

---

## 🛠 Tech Stack

- **Database:** MySQL  
- **SQL Concepts Used:**  
  `JOIN`, `GROUP BY`, `HAVING`, `CASE`, `COUNT`, `SUM`,  
  `YEAR`, `DAY`, `CONCAT`, `UPPER`, `LOWER`, `FLOOR`

---


## 📘 Learning Outcomes

- Gained strong hands-on experience with complex SQL queries
- Improved understanding of relational database design
- Learned to handle real-world data inconsistencies
- Built a solid foundation for advanced analytics and reporting

---

## 🔐 Notes

- One UPDATE query requires write permission and may fail in read-only environments
- SQL syntax follows a **MySQL-compatible dialect**
- Column mapping note:  
  `admissions.attending_doctor_id` is used to join with `doctors.doctor_id`

---

## 📎 Acknowledgment

This project was completed as part of a structured SQL learning program to simulate real-world healthcare data analysis scenarios.

---

⭐ *If you find this project useful, feel free to star the repository.*


