 -- 1.Give the room id in which the event co42010.L01 takes place.
SELECT room 
FROM event
where id = 'co42010.L01';

-- 2.For each event in module co72010 show the day, the time and the place.
SELECT id, dow, tod room 
FROM event
where modle = 'co72010';

-- 3.List the names of the staff who teach on module co72010.
SELECT DISTINCT(s.name) staff_name_co7210
FROM event e JOIN teaches t ON e.id = t.event
JOIN staff s ON t.staff = s.id
WHERE e.modle = 'co72010';

-- 4.Give a list of the staff and module number associated with events using room cr.132 on Wednesday, include the time each event starts.
SELECT s.name staff_name,
       e.modle module,
       e.tod time
FROM event e JOIN teaches t ON e.id = t.event
JOIN staff s ON t.staff = s.id
WHERE e.dow = 'Wednesday' AND e.room = 'cr.132';

-- 5.Give a list of the student groups which take modules with the word 'Database' in the name.
SELECT DISTINCT(s.name) student_group
FROM event e JOIN attends a ON e.id = a.event
JOIN student s ON a.student = s.id
WHERE e.modle IN (SELECT m.id 
				  FROM modle m WHERE m.name LIKE '%database%'); 
