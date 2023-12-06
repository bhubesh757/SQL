select commission_pct,manager_id,department_id,
COALESCE(commission_pct,manager_id,department_id,0) from employees;


select coalesce(mobile_no,office_no,resi_no,'no_phone_number') from dual;


select round(0.7) from dual;

select round(2.8) from dual;

select round(4.35) from dual;

select round(5435.7878) from dual;

select round(5435.3878) from dual;

select round(56.99) from dual;

select round(5475.7878,-2) from dual;

-- with dates
-- Round and Truncate

select NEXT_DAY('30-Nov-23', 'FRIDAY') from dual;

select ROUND(TO_DATE ('22-AUG-21'),'YEAR') from dual;

select ROUND(TO_DATE('5-JUL-23') , 'YEAR') from dual;

select TRUNC(sysdate ,'Q') from dual;
-- find the last day of the quarter of the month
select last_day (TRUNC(sysdate ,'Q') + 75) from dual;
-- last_day
-- trunc
-- round 
-- first_day
-- add_month

-- Single row Functions
-- some practice questions




