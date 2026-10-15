-- Business Question 1: Appointment details with patient and clinician
SELECT 
    p.first_name,
    p.last_name,
    a.appointment_id,
    a.appointment_type,
    a.status,
    cl.clinician_name
FROM patients p
INNER JOIN appointments a
    ON p.patient_id = a.patient_id
INNER JOIN clinicians cl
    ON a.clinician_id = cl.clinician_id;



-- Business Question 2: Appointment details with clinic information
SELECT 
    p.first_name,
    p.last_name,
    a.appointment_id,
    a.appointment_type,
    cl.clinician_name,
    c.clinic_name,
    c.region
FROM patients p
INNER JOIN appointments a
    ON p.patient_id = a.patient_id
INNER JOIN clinicians cl
    ON a.clinician_id = cl.clinician_id
INNER JOIN clinics c
    ON cl.clinic_id = c.clinic_id



-- Business Question 3: Patients with no appointments
SELECT
    p.patient_id,
    p.first_name,   
    p.last_name
FROM patients p
LEFT JOIN appointments a
    ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL; 



-- Business Question 4: Clinics with no clinicians
SELECT 
    c.clinic_id,
    c.clinic_name,
    c.region
FROM clinics c 
LEFT JOIN clinicians cl
    ON c.clinic_id = cl.clinic_id
WHERE cl.clinician_id IS NULL;



-- Business Question 5: Appointment count by clinic
SELECT 
    c.clinic_name,
    c.region,
    COUNT(a.appointment_id) AS [Appointment Count]
FROM clinics c
INNER JOIN clinicians cl
    ON c.clinic_id = cl.clinic_id
INNER JOIN appointments a
    ON cl.clinician_id = a.clinician_id
GROUP BY 
    c.clinic_name,
    c.region
ORDER BY 
    [Appointment Count] DESC;



-- Business Question 6: Clinicians with no appointments
SELECT
    cl.clinician_id,
    cl.clinician_name,
    cl.specialism,
    cl.clinic_id
FROM clinicians cl
LEFT JOIN appointments a
    ON cl.clinician_id = a.clinician_id
WHERE a.appointment_id IS NULL;
    