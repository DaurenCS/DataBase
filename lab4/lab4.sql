--1
Select * From course
where credits > 3;
--2
SELECT * from classroom
where building = 'Watson' or building = 'Packard';
--3
Select * from course
where dept_name = 'Comp. Sci.';
--4
SELECT * from course
where course_id in (select course_id from section where semester = 'Fall');
--5
Select name from student
where tot_cred > 45 and tot_cred < 90;
--6
SELECT name
FROM student
WHERE right(name , 1) IN ('a','e','i','o','u');
--7
Select *
from course
where course_id in (select course_id from prereq where prereq_id = 'CS-101');
--8

Select avg(salary), dept_name from instructor
group by dept_name
order by avg(salary)ASC;
--9
Select  building
from course
inner join department on course.dept_name=department.dept_name
group by building
order by count(course.dept_name)  DESC
limit 1;
--10
SELECT count(dept_name),dept_name
from course
group by dept_name
order by count(dept_name) ASC;

-- select id, count(dept_name)
-- from takes
-- inner join course on takes.course_id = course.course_id
-- where dept_name = 'Comp. Sci.'
-- group by id
-- having count(dept_name) >= 3;
--11
select id, name from student
where id in (select id from takes
                where left(course_id,1) in ('C')
                group by id
                having count(id) >= 3);
--12
Select * from instructor
where dept_name = 'Biology' or dept_name = 'Physics' or dept_name = 'Music';
--13
select *
from instructor
where id in (select id from teaches
                      where year = 2017);
--14
select * from student
where dept_name ='Comp. Sci.' and id in (select id
             from takes
             where grade = 'A' or grade = 'A-' );
--15
-- select * from student
-- where id in (select id
--              from takes
--              where course_id like 'CS%' and grade like 'A%');

Select name
from instructor
where id in(select i_id
            from advisor
            where s_id in(select id
                            from takes
                            where grade != 'A' and grade !='A-'));
--16

Select dept_name from course
except
Select dept_name from course
where course_id in(select takes.course_id
                   from takes
                   where grade like 'C%' or grade like 'F%');

--17
SELECT * from instructor
where id in(select id from teaches
where course_id not in(Select course_id from takes
                        where grade like 'A%'
                        group by course_id));

--18
SELECT course_id from section
where time_slot_id in(SELECT time_slot.time_slot_id from time_slot
                        where end_hr <= 12 or end_min <=30
                        order by end_hr ASC)
group by course_id;














