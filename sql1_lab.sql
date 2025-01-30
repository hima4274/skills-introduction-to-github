-- SQL Exercises (With Answers)

-- 1. Retrieve all students who enrolled in 2023.
SELECT * FROM Students WHERE YEAR(EnrollmentDate) = 2023;

-- 2. Find students whose email contains 'gmail.com'.
SELECT * FROM Students WHERE Email LIKE '%gmail.com%';

-- 3. Count how many students are enrolled in the database.
SELECT COUNT(*) FROM Students; 

-- 4. Find students born between 2000 and 2005.
SELECT * FROM Students WHERE YEAR(DateOfBirth) >= 2000 AND YEAR(DateOfBirth) <= 2005;

-- 5. List students sorted by last name in descending order.
SELECT * FROM Students ORDER BY LastName DESC; 

-- 6. Find the names of students and the courses they are enrolled in.
SELECT s.FirstName, s.LastName, c.CourseName FROM Students s 
JOIN EnrollmentID e ON s.StudentID = e.StudentID
JOIN CourseName c ON e.CourseID = c.CourseID; 

-- 7. List all students and their courses, ensuring students without courses are included (LEFT JOIN).
SELECT s.FirstName, s.LastName, c.CourseName FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN CourseName c ON e.CourseID = c.CourseID;

-- 8. Find all courses with no students enrolled (LEFT JOIN).
SELECT c.CourseID, c.CourseName FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID WHERE e.studentID IS NULL; 




-- 10. List courses and show the number of students enrolled in each course.
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS StudentNumber FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName;


