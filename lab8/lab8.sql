
-- 3
Select first_name,last_name,department_id,city,state_province
from ((employees
left join departments d on d.departmnet_id = employees.department_id)
     left join locations l on l.location_id = d.location_id)
where (last_name like '%a%' or last_name like '%A%') and (last_name like '%b%' or last_name like '%B%');

-- 4

select departmnet_name, city,state_province from departmentsё manager_name from employees e
left join employees e2 on e.manager_id = e2.employee_id;

-- 6



SELECT gradee,avg(salary) FROM employees e,job_grades s
WHERE e.salary
    BETWEEN s.lowest_salary AND s.hight_salary
GROUP BY s.gradee;

-- 7

Select first_name,last_name,department_id,city,state_province
from ((employees
left join departments d on d.departmnet_id = employees.department_id)
     left join locations l on l.location_id = d.location_id)
where city = 'Seattle'
