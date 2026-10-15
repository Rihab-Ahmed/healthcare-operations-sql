USE master;
GO

IF DB_ID('HealthcareTrainingPortfolio') IS NULL
BEGIN
    EXEC('CREATE DATABASE HealthcareTrainingPortfolio');
END;
GO

USE HealthcareTrainingPortfolio;
GO

-- Remove existing tables in dependency order
DROP TABLE IF EXISTS support_tickets;
DROP TABLE IF EXISTS referrals;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS clinicians;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS clinics;
GO


-- Clinics
CREATE TABLE clinics (
    clinic_id INT PRIMARY KEY,
    clinic_name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);


-- Patients
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    nhs_number VARCHAR(20) UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(30),
    postcode VARCHAR(10),
    created_at DATETIME NOT NULL
);


-- Clinicians
CREATE TABLE clinicians (
    clinician_id INT PRIMARY KEY,
    clinician_name VARCHAR(100) NOT NULL,
    clinic_id INT NOT NULL,
    specialism VARCHAR(50) NOT NULL,
    active_flag CHAR(1) NOT NULL,

    CONSTRAINT FK_clinicians_clinics
        FOREIGN KEY (clinic_id)
        REFERENCES clinics(clinic_id)
);


-- Appointments
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    clinician_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    appointment_type VARCHAR(50) NOT NULL,
    status VARCHAR(30) NOT NULL,
    booking_channel VARCHAR(30) NOT NULL,
    duration_minutes INT NOT NULL,
    created_at DATETIME NOT NULL,

    CONSTRAINT FK_appointments_patients
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT FK_appointments_clinicians
        FOREIGN KEY (clinician_id)
        REFERENCES clinicians(clinician_id)
);


-- Referrals
CREATE TABLE referrals (
    referral_id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    referral_date DATE NOT NULL,
    referral_source VARCHAR(50) NOT NULL,
    priority VARCHAR(20) NOT NULL,
    referral_status VARCHAR(30) NOT NULL,
    closed_date DATE,

    CONSTRAINT FK_referrals_patients
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
);


-- Support tickets
CREATE TABLE support_tickets (
    ticket_id INT PRIMARY KEY,
    patient_id INT,
    clinic_id INT NOT NULL,
    opened_at DATETIME NOT NULL,
    closed_at DATETIME,
    ticket_category VARCHAR(50) NOT NULL,
    ticket_status VARCHAR(30) NOT NULL,
    priority VARCHAR(20) NOT NULL,
    assigned_team VARCHAR(50) NOT NULL,

    CONSTRAINT FK_support_tickets_patients
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT FK_support_tickets_clinics
        FOREIGN KEY (clinic_id)
        REFERENCES clinics(clinic_id)
);