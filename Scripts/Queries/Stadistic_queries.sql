create or replace package stadistic_queries is
function PercentPerCategoryreturn return sys_refcursor;
function SellersPerGender return sys_refcursor;
function SellsPerGender return SYS_REFCURSOR;
function sellersPerAgeRange return SYS_REFCURSOR;
end stadistic_queries;

/

create or replace PACKAGE BODY stadistic_queries IS

function PercentPerCategoryreturn return sys_refcursor
as vcCursor sys_refcursor;
begin 
open vcCursor for
select b.description, count(1) 
from clock a
join category b
on a.id_category=b.id_Category
group by b.description;
return vcCursor;
end;


function SellersPerGender return sys_refcursor
as vcCursor sys_refcursor;
begin
open vcCursor for
select c.gender_name ,count(Distinct b.id_person)
from person a
join personsellclock b
on a.id_person=b.id_person
join gender c
on a.id_gender= c.id_gender
group by c.gender_name;
return vcCursor;
end;


function SellsPerGender return SYS_REFCURSOR
as vcCursor sys_refcursor;
begin
open vcCursor for
select d.gender_name, count(distinct b.id_clock)
from person a
join personsellclock b
on a.id_person=b.id_person
join person_buy_clock c
on b.id_clock=c.id_clock
join gender d
on a.id_gender=d.id_gender
group by d.gender_name;
return vcCursor;
end;

function sellersPerAgeRange return SYS_REFCURSOR
as vcCursor sys_refcursor;
begin 
open vcCursor for
select  CASE
    when age<=20 then '18-20'
    when age<=30 then '21-30'
    when age <=40 then '31-40'
    when age<=50 then '41-50'
    when age <=60 then '51-60'
    when age <=70 then '61-70'
    else '70+'
    end as age,
    count(*) as n
from(
select Distinct trunc(months_between(sysdate, a.birthday)/12) as age
from person a
join personsellclock b
on a.id_person=b.id_person) 
group by CASE
    when age<=20 then '18-20'
    when age<=30 then '21-30'
    when age <=40 then '31-40'
    when age<=50 then '41-50'
    when age <=60 then '51-60'
    when age <=70 then '61-70'
    else '70+'
    end;
return vcCursor;
end;

end;