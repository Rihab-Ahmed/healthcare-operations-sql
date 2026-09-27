-- Business Question 1: Appointment status summary
SELECT 
	status,
	COUNT(*) AS [Appointment Count]
FROM appointments
GROUP BY status
ORDER BY [Appointment Count] DESC;

-- Business Question 2: Booking channel usage
SELECT
	booking_channel AS [Booking Channel],
	COUNT(*) AS [Appointment Count],
	AVG(duration_minutes) AS [Average Duration]
FROM appointments
GROUP BY booking_channel
HAVING COUNT(*) >= 2
ORDER BY [Appointment Count] DESC;

-- Business Question 3: Appointment type workload
SELECT 
	appointment_type AS [Appointment Type],
	COUNT(*) AS [Number of Appointments],
	MIN(duration_minutes) AS [Shortest Duration],
	MAX(duration_minutes) AS [Longest Duration],
	AVG(duration_minutes) AS [Average Duration]
FROM appointments
GROUP BY appointment_type
ORDER BY [Appointment Type] ASC;

-- Business Question 4: Completed appointment analysis
SELECT	
	booking_channel AS [Booking Channel],
	COUNT(*) AS [Completed Count],
	SUM(duration_minutes) AS [Total Completed Minutes]
FROM appointments
WHERE status = 'Completed'
GROUP BY booking_channel
ORDER BY [Completed Count] DESC;

-- Business Question 5: Operational exception report
SELECT 
	appointment_id, appointment_type, status, duration_minutes
FROM appointments
WHERE status IN ('Cancelled', 'No Show')
ORDER BY status ASC, duration_minutes DESC;