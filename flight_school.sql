IF DB_ID('flight_school') IS NOT NULL
    DROP DATABASE flight_school;


CREATE DATABASE flight_school;


USE flight_school;


CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    status VARCHAR(20),
    enrollment_date DATE,
    email VARCHAR(100),
    phone VARCHAR(20),
    date_of_birth DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


CREATE TABLE Checkride (
    checkride_id INT PRIMARY KEY,
    student_id INT,
    type VARCHAR(50),
    examiner_name VARCHAR(50),
    date DATE,
    results VARCHAR(20),
    notes VARCHAR(MAX),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    student_id INT,
    method VARCHAR(20),
    amount DECIMAL(10,2),
    description VARCHAR(MAX),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);


CREATE TABLE Certification (
    cert_id INT PRIMARY KEY,
    student_id INT,
    cert_type VARCHAR(50),
    issue_date DATE,
    expiration_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);


CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    category VARCHAR(50),
    required_hours INT,
    description VARCHAR(MAX),
    course_name VARCHAR(100)
);


CREATE TABLE Enroll_in (
    course_id INT,
    student_id INT,
    PRIMARY KEY (course_id, student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);


CREATE TABLE Lesson (
    lesson_id INT PRIMARY KEY,
    course_id INT,
    lesson_title VARCHAR(100),
    lesson_type VARCHAR(50),
    duration_hours INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);


CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    certification_level VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    hire_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY,
    tail_number VARCHAR(20),
    hours_flown INT,
    model VARCHAR(50),
    type VARCHAR(50),
    status VARCHAR(20)
);


CREATE TABLE Maintenance_Record (
    record_id INT PRIMARY KEY,
    aircraft_id INT,
    hours_at_service INT,
    technician_name VARCHAR(50),
    description VARCHAR(MAX),
    maintenance_date DATE,
    next_due_date DATE,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);


CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY,
    student_id INT,
    instructor_id INT,
    aircraft_id INT,
    lesson_id INT,
    status VARCHAR(20),
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id),
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id),
    FOREIGN KEY (lesson_id) REFERENCES Lesson(lesson_id)
);


INSERT INTO Student VALUES
(1,'active','2024-01-10','s1@mail.com','123456','2000-05-05','Alex','Doe'),
(2,'active','2024-02-15','s2@mail.com','789012','1999-10-10','Jamie','Roe');


INSERT INTO Instructor VALUES
(10,'CFI','555123','inst1@mail.com','2020-06-01','Chris','Vale'),
(11,'Senior CFI','555999','inst2@mail.com','2019-04-03','Morgan','Lee');


INSERT INTO Aircraft VALUES
(100,'A123',150,'Cessna 172','Single Engine','available'),
(101,'B456',300,'Piper PA-28','Single Engine','available');


INSERT INTO Course VALUES
(200,'Private Pilot',40,'Basic flying course','PPL Course');


INSERT INTO Lesson VALUES
(300,200,'Intro Flight','Flight',2),
(301,200,'Basic Maneuvers','Flight',3);
