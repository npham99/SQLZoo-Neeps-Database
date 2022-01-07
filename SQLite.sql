-- 6.Show the 'size' of each of the co72010 events. Size is the total number of students attending each event.
SELECT e.id class, SUM(s.sze) size
FROM event e JOIN attends a ON e.id = a.event
JOIN student s ON a.student = s.id
WHERE e.modle = 'co72010'
GROUP BY e.id;

-- 7.For each post-graduate module, show the size of the teaching team. (post graduate modules start with the code co7).
SELECT e.id class, 
       COUNT(DISTINCT(t.staff)) staff_size
FROM event e JOIN teaches t ON e.id = t.event
WHERE e.modle LIKE 'co7%'
GROUP BY e.id;

-- 8.Give the full name of those modules which include events taught for fewer than 10 weeks.
SELECT DISTINCT m.name 
FROM modle m JOIN event e ON e.modle = m.id
JOIN occurs o ON e.id = o.event
GROUP BY e.id, m.name
HAVING COUNT(o.event) < 10;

-- 9.Identify those events which start at the same time as one of the co72010 lectures.
SELECT e.id
FROM event e
WHERE CONCAT(e.dow, e.tod) IN
    (SELECT CONCAT(e.dow, e.tod)
     FROM event e
      WHERE e.modle = 'co72010');
      
-- 10.How many members of staff have contact time which is greater than the average?
WITH s_contact_time_table AS (
  SELECT staff, SUM(duration) staff_time
  FROM teaches t JOIN event e ON t.event = e.id
  GROUP BY staff
)
SELECT COUNT(*) staff_count
FROM s_contact_time_table
WHERE staff_time > (SELECT AVG(staff_time) FROM s_contact_time_table);