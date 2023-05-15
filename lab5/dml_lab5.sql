--4
SELECT * from warehouses;

--5

Select * from boxes
where value > 150;
--6
select distinct contents
from boxes;

--7

SELECT code, capacity from warehouses;

--8
SELECT code, capacity from warehouses
where capacity > 2;

--9

INSERT into warehouses
values (6,'New York',3);

-- select * from warehouses

--10
INSERT into boxes
values ('H5RT','Papers',200, 2);

--11

update boxes
set value = value - 0.15 * value
where value =(select value from boxes
                            order by value DESC
                            limit 1 offset 3);

--12

delete from boxes
where value < 150;

--13

delete from boxes
where warehouse in(select code
                   from warehouses
                   where location = 'New York')
returning *;