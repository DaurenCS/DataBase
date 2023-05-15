-- a
Select * from client
cross join dealer;

-- select * from client
-- left join dealer d on client.dealer_id = d.id;

-- b

Select * from ((dealer
left join client c on dealer.id = c.dealer_id)
left join sell s on s.client_id = c.id );

-- c
Select * from dealer
inner join client c on location = c.city;

-- d

select * from client
inner join sell s on client.id = s.client_id
where s.amount between 100 and 500;

-- e

SELECT * FROM dealer d left JOIN client c on d.id = c.dealer_id
    WHERE d.id in (SELECT dealer_id FROM client GROUP BY dealer_id HAVING count(dealer_id) >= 1);

-- f

SELECT c.name, c.city, d.name, d.charge
FROM dealer d left JOIN client c on d.id = c.dealer_id;

-- g
select * from client
inner join dealer d on client.dealer_id = d.id
where d.charge > 0.12;



-- h
SELECT c.name, c.city, s.id, s.date, s.amount, d.name, d.charge
    FROM sell s INNER JOIN client c on c.id = s.client_id
                  INNER JOIN dealer d on d.id = s.dealer_id;


-- i

select * from client;

select * from dealer;

select * from sell;

select client.name,priority,d.name,s.id,s.amount from client
right outer join dealer d on d.id = client.dealer_id
inner join sell s on client.id = s.client_id
where amount >=1200 and client.priority is not null;



-- a
create view count_client as
    select date, count(distinct client_id),avg(amount),sum(amount)
    from sell
    group by date;

select * from count_client;

-- b
create or replace view topDate as
    select sum(amount) from sell
    group by date
    order by sum(amount) desc
    limit 5;


SELECT * from topDate;

-- c
create view count_sales as
select s.dealer_id, count(s.id),avg(s.amount),sum(s.amount) from dealer
inner join sell s on dealer.id = s.dealer_id
group by s.dealer_id;

SELECT * from count_sales;


-- d
create view city_amount AS
SELECT d.location, sum(s.amount) * sum(d.charge) FROM dealer d
    INNER JOIN sell s ON d.id = s.dealer_id
    GROUP BY d.location;


-- e
create view localSum as
select location,sum(amount) as Sum, avg(amount),count(*) from sell
inner join dealer d on d.id = sell.dealer_id
group by d.location;

-- f
create  view  city_Summ as
SELECT c.city, count(s.id), avg(s.amount), sum(s.amount)as clientSum FROM sell s
    INNER JOIN client c on s.client_id = c.id
    GROUP BY c.city;
-- g
create view client_cityy as
SELECT c.city, s.Sum, c.clientSum FROM localSum s
    INNER JOIN city_Summ c on s.location = c.city
        where c.clientSum >s.sum;

select * from client_cityy


