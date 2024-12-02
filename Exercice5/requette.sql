1-

SELECT m.id, m.date, r.name AS room_name, b.name AS building_name
FROM meetings m
JOIN rooms r ON m.room_id = r.id
JOIN buildings b ON r.building_id = b.id
WHERE b.country = 'Mayotte'
ORDER BY m.date DESC
LIMIT 10;


SELECT meetings.id, meetings.date, rooms.name AS room_name, b.name AS building_name
FROM meetings m
JOIN rooms r ON meetings.room_id = r.id
JOIN buildings b ON rooms.building_id = buildings.id
WHERE buildings.country = 'Mayotte'
ORDER BY meetings.date DESC
LIMIT 10;