Create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(20),
    state_province varchar(12)

);

Create table departments(
    departmnet_id serial primary key,
    departmnet_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

CREATE TABLE employees
    ( employee_id    SERIAL PRIMARY KEY
    , first_name     VARCHAR(20)
    , last_name      VARCHAR(25) NOT NULL
    , email          VARCHAR(25) NOT NULL
    , phone_number   VARCHAR(20)
    , hire_date      TIMESTAMP  NOT NULL
    , job_id         VARCHAR(10) NOT NULL
    , salary         NUMERIC(8,2)
    , commission_pct NUMERIC(2,2)
    , manager_id     INTEGER REFERENCES employees(employee_id)
    , department_id  INTEGER REFERENCES departments(departmnet_id)
    , CONSTRAINT     emp_salary_min
                     CHECK (salary > 0)
    , CONSTRAINT     emp_email_uk
                     UNIQUE (email)
    ) ;

create table job_grades(
    gradee char(1),
    lowest_salary integer,
    hight_salary integer
)



