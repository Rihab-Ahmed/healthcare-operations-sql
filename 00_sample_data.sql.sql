USE HealthcareTrainingPortfolio;
GO

-- Clear existing sample data so this script can be rerun
DELETE FROM support_tickets;
DELETE FROM referrals;
DELETE FROM appointments;
DELETE FROM clinicians;
DELETE FROM patients;
DELETE FROM clinics;
GO


-- =========================
-- Clinics
-- =========================

INSERT INTO clinics (clinic_id, clinic_name, region)
VALUES
(1, 'Redbridge Hearing Centre', 'East London'),
(2, 'Finchley Hearing Centre', 'North London'),
(3, 'City Hearing Centre', 'Central London'),
(4, 'Stratford Hearing Centre', 'East London'),
(5, 'Riverside Hearing Centre', 'West London');


-- =========================
-- Patients
-- =========================

INSERT INTO patients
(
    patient_id,
    nhs_number,
    first_name,
    last_name,
    date_of_birth,
    email,
    phone_number,
    postcode,
    created_at
)
VALUES
(1,  '9000000001', 'Aisha',    'Begum',    '1985-04-12', 'aisha@example.com',   '07111111111', 'E1 5AA',   '2025-01-10'),
(2,  '9000000002', 'Mohammed', 'Khan',     '1971-09-23', NULL,                  '07222222222', 'E7 8BB',   '2025-03-15'),
(3,  '9000000003', 'Sarah',    'Ahmed',    '1994-06-18', 'sarah@example.com',   '07333333333', 'IG1 2CC',  '2025-06-20'),
(4,  '9000000004', 'James',    'Smith',    '1966-11-02', 'james@example.com',   '07444444444', 'N3 1DD',   '2024-08-01'),
(5,  '9000000005', 'Fatima',   'Ali',      '2001-02-27', NULL,                  '07555555555', 'E12 6EE',  '2025-09-12'),
(6,  '9000000006', 'Daniel',   'Jones',    '1989-12-05', 'daniel@example.com',  '07666666666', 'RM6 4FF',  '2026-01-07'),
(7,  '9000000007', 'Maryam',   'Hussain',  '1978-07-14', 'maryam@example.com',  '07777777777', 'E6 3GG',   '2025-11-18'),
(8,  '9000000008', 'Thomas',   'Brown',    '1959-03-30', NULL,                  '07888888888', 'N12 8HH',  '2024-12-21'),
(9,  '9000000009', 'Zainab',   'Rahman',   '1992-05-16', 'zainab@example.com',  '07121212121', 'E15 4JJ',  '2026-01-15'),
(10, '9000000010', 'Oliver',   'Taylor',   '1983-10-08', 'oliver@example.com',  '07232323232', 'W3 7KK',   '2026-02-01'),
(11, '9000000011', 'Hana',     'Mahmood',  '1999-08-21', NULL,                  '07343434343', 'IG3 9LL',  '2026-02-11'),
(12, '9000000012', 'George',   'Wilson',   '1954-01-19', 'george@example.com',  '07454545454', 'N7 2MM',   '2025-12-03'),
(13, '9000000013', 'Layla',    'Ahmed',    '1987-03-09', 'layla@example.com',   '07565656565', 'E11 1NN',  '2026-03-05'),
(14, '9000000014', 'Adam',     'Clark',    '1975-06-11', NULL,                  '07676767676', 'EC1 4PP',  '2026-03-18'),
(15, '9000000015', 'Nadia',    'Iqbal',    '1996-09-30', 'nadia@example.com',   '07787878787', 'E17 5QQ',  '2026-04-02'),
(16, '9000000016', 'Michael',  'Evans',    '1969-12-17', 'michael@example.com', '07898989898', 'N10 3RR',  '2026-04-20'),
(17, '9000000017', 'Samira',   'Chowdhury','1990-11-25', NULL,                  '07131313131', 'IG2 6SS',  '2026-05-10'),
(18, '9000000018', 'Peter',    'Martin',   '1981-07-07', 'peter@example.com',   '07242424242', 'W5 2TT',   '2026-05-19');


-- =========================
-- Clinicians
-- =========================

INSERT INTO clinicians
(
    clinician_id,
    clinician_name,
    clinic_id,
    specialism,
    active_flag
)
VALUES
(1, 'Dr Amina Rahman', 1, 'Audiology', 'Y'),
(2, 'Dr David Patel', 2, 'Audiology', 'Y'),
(3, 'Dr Emily Wilson', 3, 'ENT', 'Y'),
(4, 'Dr Hassan Malik', 1, 'Audiology', 'N'),
(5, 'Dr Laura Green', 2, 'ENT', 'Y'),
(6, 'Dr Priya Shah', 4, 'Audiology', 'Y'),
(7, 'Dr Omar Khan', 3, 'Audiology', 'Y'),
(8, 'Dr Sophie Turner', 4, 'ENT', 'Y');


-- =========================
-- Appointments
-- =========================

INSERT INTO appointments
(
    appointment_id,
    patient_id,
    clinician_id,
    appointment_date,
    appointment_type,
    status,
    booking_channel,
    duration_minutes,
    created_at
)
VALUES
(1001, 1,  1, '2026-01-05T09:00:00', 'Hearing Assessment', 'Completed', 'Phone',     30, '2025-12-15'),
(1002, 2,  1, '2026-01-05T10:00:00', 'Hearing Aid Fitting','Completed', 'Online',    45, '2025-12-18'),
(1003, 3,  2, '2026-01-06T11:30:00', 'Hearing Assessment', 'No Show',   'Phone',     30, '2025-12-20'),
(1004, 4,  3, '2026-01-07T14:00:00', 'ENT Consultation',   'Cancelled', 'Online',    30, '2025-12-22'),
(1005, 5,  1, '2026-01-08T09:30:00', 'Hearing Assessment', 'Completed', 'Reception', 30, '2025-12-28'),
(1006, 1,  2, '2026-02-02T10:30:00', 'Follow Up',          'Completed', 'Phone',     20, '2026-01-10'),
(1007, 6,  3, '2026-02-03T13:00:00', 'ENT Consultation',   'Completed', 'Online',    30, '2026-01-11'),
(1008, 2,  1, '2026-02-05T15:00:00', 'Follow Up',          'No Show',   'Phone',     20, '2026-01-15'),
(1009, 7,  2, '2026-02-10T09:00:00', 'Hearing Assessment', 'Completed', 'Online',    30, '2026-01-20'),
(1010, 8,  5, '2026-02-12T14:30:00', 'ENT Consultation',   'Completed', 'Phone',     30, '2026-01-22'),
(1011, 3,  2, '2026-03-01T11:00:00', 'Follow Up',          'Completed', 'Reception', 20, '2026-02-10'),
(1012, 5,  1, '2026-03-04T10:00:00', 'Hearing Aid Fitting','Cancelled', 'Online',    45, '2026-02-15'),
(1013, 9,  6, '2026-03-08T09:00:00', 'Hearing Assessment', 'Completed', 'Online',    30, '2026-02-20'),
(1014, 10, 6, '2026-03-10T11:00:00', 'Follow Up',          'Completed', 'Phone',     20, '2026-02-21'),
(1015, 11, 7, '2026-03-15T14:00:00', 'Hearing Assessment', 'No Show',   'Reception', 30, '2026-02-25'),
(1016, 12, 3, '2026-03-18T15:30:00', 'ENT Consultation',   'Completed', 'Online',    60, '2026-03-01'),
(1017, 13, 6, '2026-04-02T09:30:00', 'Wax Removal',        'Completed', 'Phone',     30, '2026-03-10'),
(1018, 14, 7, '2026-04-06T10:00:00', 'Hearing Assessment', 'Completed', 'Online',    30, '2026-03-12'),
(1019, 15, 2, '2026-04-09T13:00:00', 'Hearing Aid Fitting','Completed', 'Reception', 45, '2026-03-15'),
(1020, 16, 5, '2026-04-12T14:30:00', 'ENT Consultation',   'Cancelled', 'Phone',     30, '2026-03-18'),
(1021, 1,  1, '2026-04-15T09:00:00', 'Follow Up',          'Completed', 'Online',    20, '2026-03-20'),
(1022, 2,  1, '2026-04-20T10:30:00', 'Hearing Assessment', 'Completed', 'Phone',     30, '2026-03-22'),
(1023, 3,  2, '2026-05-03T11:30:00', 'Hearing Aid Fitting','Completed', 'Reception', 45, '2026-04-01'),
(1024, 4,  3, '2026-05-05T13:00:00', 'ENT Consultation',   'No Show',   'Online',    30, '2026-04-03'),
(1025, 5,  1, '2026-05-08T09:00:00', 'Follow Up',          'Completed', 'Phone',     20, '2026-04-05'),
(1026, 6,  7, '2026-05-12T10:00:00', 'Hearing Assessment', 'Completed', 'Online',    30, '2026-04-08'),
(1027, 7,  2, '2026-05-18T14:00:00', 'Hearing Aid Fitting','Cancelled', 'Reception', 45, '2026-04-10'),
(1028, 8,  5, '2026-05-21T15:00:00', 'ENT Consultation',   'Completed', 'Phone',     60, '2026-04-15'),
(1029, 9,  6, '2026-06-02T09:30:00', 'Follow Up',          'Completed', 'Online',    20, '2026-05-01'),
(1030, 10, 6, '2026-06-06T11:00:00', 'Hearing Assessment', 'Completed', 'Phone',     30, '2026-05-04'),
(1031, 11, 7, '2026-06-10T13:30:00', 'Wax Removal',        'Completed', 'Reception', 30, '2026-05-06'),
(1032, 12, 3, '2026-06-14T14:00:00', 'ENT Consultation',   'Cancelled', 'Online',    30, '2026-05-10'),
(1033, 13, 6, '2026-07-01T09:00:00', 'Hearing Assessment', 'Completed', 'Phone',     30, '2026-06-01'),
(1034, 14, 7, '2026-07-05T10:30:00', 'Follow Up',          'Completed', 'Online',    20, '2026-06-05'),
(1035, 15, 2, '2026-08-03T11:00:00', 'Hearing Aid Fitting','Booked',    'Reception', 45, '2026-07-01'),
(1036, 16, 5, '2026-09-07T15:00:00', 'ENT Consultation',   'Booked',    'Phone',     30, '2026-08-01');


-- =========================
-- Referrals
-- =========================

INSERT INTO referrals
(
    referral_id,
    patient_id,
    referral_date,
    referral_source,
    priority,
    referral_status,
    closed_date
)
VALUES
(2001, 1,  '2025-12-15', 'GP',            'Routine', 'Closed', '2026-01-05'),
(2002, 2,  '2025-12-18', 'GP',            'Urgent',  'Closed', '2026-01-05'),
(2003, 3,  '2025-12-20', 'Hospital',      'Routine', 'Open',   NULL),
(2004, 4,  '2025-12-21', 'GP',            'Urgent',  'Closed', '2026-01-07'),
(2005, 5,  '2025-12-28', 'Self Referral', 'Routine', 'Closed', '2026-01-08'),
(2006, 6,  '2026-01-03', 'Hospital',      'Urgent',  'Closed', '2026-02-03'),
(2007, 7,  '2026-01-12', 'GP',            'Routine', 'Open',   NULL),
(2008, 8,  '2026-01-15', 'GP',            'Routine', 'Closed', '2026-02-12'),
(2009, 9,  '2026-02-10', 'Self Referral', 'Routine', 'Closed', '2026-03-08'),
(2010, 10, '2026-02-15', 'GP',            'Urgent',  'Closed', '2026-03-10'),
(2011, 11, '2026-02-20', 'Hospital',      'Urgent',  'Open',   NULL),
(2012, 12, '2026-03-01', 'GP',            'Routine', 'Closed', '2026-03-18'),
(2013, 13, '2026-03-10', 'Self Referral', 'Routine', 'Closed', '2026-04-02'),
(2014, 14, '2026-03-12', 'Hospital',      'Urgent',  'Open',   NULL),
(2015, 15, '2026-03-15', 'GP',            'Routine', 'Closed', '2026-04-09');


-- =========================
-- Support Tickets
-- =========================

INSERT INTO support_tickets
(
    ticket_id,
    patient_id,
    clinic_id,
    opened_at,
    closed_at,
    ticket_category,
    ticket_status,
    priority,
    assigned_team
)
VALUES
(3001, 1,    1, '2026-01-05T08:30:00', '2026-01-05T09:15:00', 'Booking',        'Closed', 'Low',    'Appointments'),
(3002, 2,    1, '2026-01-06T09:00:00', '2026-01-06T12:30:00', 'Patient Record', 'Closed', 'Medium', 'Data Support'),
(3003, NULL, 2, '2026-01-07T11:00:00', NULL,                  'System Access',   'Open',   'High',   'IT Support'),
(3004, 4,    3, '2026-01-08T14:00:00', '2026-01-09T10:00:00', 'Referral',       'Closed', 'Medium', 'Referrals'),
(3005, 5,    1, '2026-02-01T10:30:00', '2026-02-01T11:00:00', 'Booking',        'Closed', 'Low',    'Appointments'),
(3006, 6,    3, '2026-02-03T09:00:00', NULL,                  'Patient Record',  'Open',   'High',   'Data Support'),
(3007, 7,    2, '2026-02-10T13:00:00', '2026-02-11T09:00:00', 'System Access',  'Closed', 'Medium', 'IT Support'),
(3008, NULL, 2, '2026-03-02T08:45:00', NULL,                  'System Error',    'Open',   'High',   'IT Support'),
(3009, 9,    4, '2026-03-09T10:00:00', '2026-03-09T12:00:00', 'Booking',        'Closed', 'Low',    'Appointments'),
(3010, 10,   4, '2026-03-11T11:30:00', NULL,                  'Patient Record',  'Open',   'Medium', 'Data Support'),
(3011, 11,   3, '2026-04-01T09:15:00', '2026-04-02T13:00:00', 'Referral',       'Closed', 'Medium', 'Referrals'),
(3012, NULL, 5, '2026-04-05T14:00:00', NULL,                  'System Access',   'Open',   'High',   'IT Support'),
(3013, 13,   4, '2026-05-03T10:20:00', '2026-05-03T11:00:00', 'Booking',        'Closed', 'Low',    'Appointments'),
(3014, 14,   3, '2026-05-15T08:30:00', NULL,                  'System Error',    'Open',   'High',   'IT Support'),
(3015, 15,   2, '2026-06-10T12:00:00', '2026-06-10T15:30:00', 'Patient Record', 'Closed', 'Medium', 'Data Support'),
(3016, 16,   1, '2026-07-02T09:00:00', NULL,                  'Referral',        'Open',   'Medium', 'Referrals');
GO