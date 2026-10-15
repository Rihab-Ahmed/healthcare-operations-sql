-- Business Question 1: Appointment duration classification
SELECT 
	appointment_id,
	appointment_type,
	duration_minutes,
CASE	
	WHEN duration_minutes >= 45 THEN 'Long'
	WHEN duration_minutes >= 30 THEN 'Standard'
	ELSE 'Short'
END AS [Duration Category]
FROM appointments;


-- Business Question 2: Appointment status classification
SELECT 
	appointment_id,
	status,
CASE
	WHEN status = 'Completed' THEN 'Finished'
	WHEN status = 'Cancelled' THEN 'Did Not Proceed'
	WHEN status = 'No Show' THEN 'Did Not Attend'
	WHEN status = 'Booked' THEN 'Upcoming'
	ELSE 'Other'
END AS [Status Category]
FROM appointments;


-- Business Question 3: Referral priority classification
SELECT 
	referral_id,
	priority,
	referral_status,
CASE 
	WHEN priority = 'Urgent' 
		AND referral_status = 'Open' 
	THEN 'Urgent Open Referral'
	WHEN priority = 'Urgent' THEN 'Urgent Referral'
	ELSE 'Routine Referral'
END AS [Referral Category]
FROM referrals;


-- Business Question 4: Appointment outcome grouping

SELECT
    appointment_id,
    status,
    duration_minutes,
    CASE
        WHEN status = 'Completed'
            AND duration_minutes >= 30
            THEN 'Completed - Long/Standard'
        WHEN status = 'Completed'
            AND duration_minutes < 30
            THEN 'Completed - Short'
        WHEN status IN ('Cancelled', 'No Show')
            THEN 'Did Not Complete'
        WHEN status = 'Booked'
            THEN 'Upcoming'
        ELSE 'Other'
    END AS [Outcome Category]
FROM appointments;


-- Business Question 5: Appointment count by duration category
SELECT
    CASE
        WHEN priority = 'Urgent' THEN 'Urgent'
        ELSE 'Routine'
    END AS [Priority Group],
    COUNT(*) AS [Referral Count]
FROM referrals
GROUP BY
    CASE
        WHEN priority = 'Urgent' THEN 'Urgent'
        ELSE 'Routine'
    END;


SELECT
    CASE
        WHEN duration_minutes >= 45 THEN 'Long'
        WHEN duration_minutes >= 30 THEN 'Standard'
        ELSE 'Short'
    END AS [Duration Category],
    Count(*) AS [Appointment Count]
FROM appointments
GROUP BY
    CASE
        WHEN duration_minutes >= 45 THEN 'Long'
        WHEN duration_minutes >= 30 THEN 'Standard'
        ELSE 'Short'
    END
ORDER BY [Appointment Count] DESC;
   