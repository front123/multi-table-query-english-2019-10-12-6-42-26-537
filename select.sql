# 1.Query the existence of 1 course
select * from course where id =1;

# 2.Query the presence of both 1 and 2 courses
select count(1) from course c1, course c2 where c1.id = 1 and c2.id = 2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select s.id as id, s.name as name, avg(sc.score) as average_score
from student s, student_course sc 
where s.id=sc.studentId group by s.id having avg(sc.score) >= 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student s where s.id not in (select sc.studentId from student_course sc);

# 5.Query all SQL with grades
with grades as (select score from student_course) select grades.score from grades;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select s.id as id, s.name as name, s.age, s.sex from student s, student_course sc 
where s.id = sc.studentId and s.id = 1 and sc.courseId = 2;

# 7.Retrieve 1 student score with less than 60 scores in descending order
select score from student_course where score < 60 order by score desc limit 1;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select sc.courseId, avg(sc.score) as average_score 
from student_course sc group by sc.courseId 
order by avg(sc.score) desc, sc.courseId asc;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select s.name as name, sc.score as score from student s, student_course sc 
where s.id = sc.studentId and sc.score<60 and sc.courseId in (
select c.id from course c where c.name = 'Math');
