-- 1
create function Increments(val integer )
returns integer as
$$
    BEGIN
    return val+1;
    end;
$$
language plpgsql;

select Increments(123);
-- 2
create function get_sum(a integer, b integer)
returns integer as
$$
    BEGIN
    return a+b;
    end;
$$
language plpgsql;

select get_sum(123,123);
-- 3

create function divisible(val integer)
returns bool as
$$
BEGIN
return val%2 = 0;
end;
$$
language plpgsql;

select divisible(13);

-- 4
create or replace function validate(password varchar)
returns bool as
$$
    declare
        res  boolean;
begin
    select case
            when name = password then 1
            else 0
    end into res
    from client;
    return res;
end;

$$
language plpgsql;

select validate('Айш');

-- 5
create function sum_avg(out a int, out b int)
as $$
    begin
        select sum(amount) from sell into a;
        select avg(amount) from sell into b;
    end;
    $$
language plpgsql;


select * from sum_avg();



create or replace function now_date()
    returns trigger AS
    $$
    begin
        raise notice 'UPDATE time=%', now();
        return new;
    end;
    $$
language plpgsql;

create trigger now_date
    before insert or update
    on task4
    for each row execute function now_date();
--b
create or replace function  age()
    returns trigger as
    $$
    begin
        raise notice 'AGE =%', age(now(),new.date_of_birth);
        return new;
    end;
    $$
language plpgsql;

create trigger birth after insert on task4
    for each row execute function age();
--c

create or replace function  salary_update()
    returns trigger as
    $$
    begin
        new.salary:=new.salary*1.12;
        return new;
    end;
    $$
language plpgsql;
create trigger  salary_up before insert or update
    ON task4
    for each row execute function salary_update();


--d


create or replace function  stop()
    returns trigger as
    $$
    BEGIN
        RETURN new;
    end;
    $$
LANGUAGE plpgsql;

create trigger stop before delete
    ON task4
    for each row execute function stop();


--e


--3


CREATE TABLE task4(
    id int,
    name varchar,
    date_of_birth date,
    age int,
    salary int,
    workexpirience int,
    discount int,
    PRIMARY KEY(id)
);

--a
BEGIN;
    UPDATE task4 SET salary=salary*pow(1.1,workexpirience/2), discount=10+(task4.workexpirience-2)/5 WHERE workexpirience>=2;
COMMIT;
--b
BEGIN;
    UPDATE task4 SET salary=salary*1.15 WHERE workexpirience=40;
    UPDATE task4 SET salary=salary*1.15, discount=20 WHERE workexpirience>=8;
COMMIT;