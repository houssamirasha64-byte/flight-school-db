-- Extra sample data for flight_school.
-- All names, dates and amounts are made up for testing.
-- Run flight_school.sql first, then this file.

USE flight_school;


INSERT INTO Checkride VALUES
(1,1,'Private Pilot Checkride','Dana Ruiz','2024-06-01','Pass','Good landings and radio work'),
(2,2,'Private Pilot Checkride','Tom Lee','2024-07-12','Retake','Needs more practice with crosswind landings');


INSERT INTO Payment VALUES
(1,1,'Card',1500.00,'Tuition deposit','2024-01-10'),
(2,2,'Bank Transfer',1500.00,'Tuition deposit','2024-02-15'),
(3,1,'Card',800.00,'Tuition balance','2024-03-01');


INSERT INTO Certification VALUES
(1,1,'Private Pilot License','2024-07-01','2026-07-01'),
(2,2,'Medical Certificate','2024-02-20','2025-02-20');


INSERT INTO Enroll_in VALUES
(200,1),
(200,2);


INSERT INTO Schedule VALUES
(1,1,10,100,300,'completed','2024-01-20 09:00','2024-01-20 11:00'),
(2,1,10,100,301,'scheduled','2026-11-02 09:00','2026-11-02 12:00'),
(3,2,11,101,300,'scheduled','2026-11-03 13:00','2026-11-03 15:00');


INSERT INTO Maintenance_Record VALUES
(1,100,150,'Tom Lee','100-hour inspection','2025-03-01','2025-09-01'),
(2,101,300,'Taylor Quinn','Oil change and brake check','2025-05-10','2025-11-10');
