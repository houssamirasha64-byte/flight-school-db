# Flight School Database

A relational database for a flight school management system, designed and implemented in SQL Server (T-SQL). It models students, instructors, aircraft, courses and lessons, scheduling, maintenance, certifications and payments.

## Domain

A flight school has to track:

- **Students** and their enrollment, personal details and progress
- **Instructors** and their certification level and employment details
- **Aircraft** and their maintenance history
- **Courses** and **lessons**, and which students are enrolled in each course
- **Schedules** that link a student, an instructor, an aircraft and a lesson
- **Checkrides**, **certifications** and **payments** for each student

## Design

- **ER/EER diagram:** [docs/EER-diagram.png](docs/EER-diagram.png)
- **Relational schema:** [docs/relational-schema.jpg](docs/relational-schema.jpg)

Each entity has a primary key. Foreign keys link checkrides, payments, certifications, enrollments, lessons, schedules and maintenance records to their parent tables. The design avoids redundancy and keeps the data consistent through referential integrity.

## Tables

| Table | Primary key | Purpose |
|-------|-------------|---------|
| `Student` | `student_id` | Student personal and enrollment details |
| `Checkride` | `checkride_id` | Checkrides taken by a student |
| `Payment` | `payment_id` | Payments made by a student |
| `Certification` | `cert_id` | Certifications earned by a student |
| `Course` | `course_id` | Course catalogue |
| `Enroll_in` | `(course_id, student_id)` | Students enrolled in courses |
| `Lesson` | `lesson_id` | Lessons within a course |
| `Instructor` | `instructor_id` | Instructor details |
| `Aircraft` | `aircraft_id` | Aircraft fleet |
| `Maintenance_Record` | `record_id` | Maintenance history for each aircraft |
| `Schedule` | `schedule_id` | Booked lessons with student, instructor and aircraft |

## Run

The script drops and recreates the `flight_school` database, then creates the tables and loads sample data. It needs SQL Server, for example run through SSMS or `sqlcmd`:

```bash
sqlcmd -S localhost -E -i flight_school.sql
sqlcmd -S localhost -E -i sample_data.sql
```

## Files

- `flight_school.sql`: schema and sample data
- `sample_data.sql`: extra made-up sample rows for the other tables. Run it after `flight_school.sql`
- `docs/EER-diagram.png`: ER/EER diagram
- `docs/relational-schema.jpg`: relational schema
