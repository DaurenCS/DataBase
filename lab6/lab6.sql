-- 1
Select  * from student
where dept_name = 'Comp. Sci.' and tot_cred > 50;

-- 2

select * from instructor
where salary > 50000;

Select * from instructor
where name like 'C%';

-- 3
select name, |/salary as square  from instructor;

select id, name, pow(tot_cred, 0.5) from student;

select * from boxes;
-- 4
SELECT
    FORMAT(' Course name is %s Department name : %s', title , dept_name) as info FROM course;

SELECT warehouse &  5 as bitwise_operator from boxes;

SELECT * from student WHERE name LIKE 'K%';

SELECT
    CASE
        when dept_name = 'Finance' then 'BS'
        when dept_name = 'Comp. Sci.' then 'FIT'
    END as faculty
FROM student;

SELECT COALESCE(dept_name,'No dept name') from student;

SELECT greatest(tot_cred, 50)  from student;

SELECT * from section WHERE year BETWEEN 2015 AND 2017;

SELECT avg(tot_cred) as mid from student;

SELECT * from student WHERE dept_name in ('History', 'Finance');

SELECT * from student WHERE dept_name not in ('History', 'Finance');
