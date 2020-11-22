create or replace package users_queries is
function SearchClock(pName VARCHAR2, pidCategory number, pidBrand number, pidCondition number, pidShipping number, pmodel varchar, pid_clock number,pPrice NUMBER)
return sys_refcursor;
function UserBuyHistory(pidUser number)return sys_refcursor;
function UserSellHistory (pidUser number,pid_status number)
return sys_refcursor;
function  ExpensivePruchaseCatergory(pidUser number, pidCategory number)
return sys_refcursor;

end users_queries;
/
CREATE OR REPLACE PACKAGE BODY users_queries IS

function SearchClock(pName VARCHAR2, pidCategory number, pidBrand number, pidCondition number, pidShipping number, pmodel varchar, pid_clock number, pPrice NUMBER)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select a.name, a.model,a.manifacturing_date, a.price, d.description , b.name, c.description, e.description
from clock a
join brand b
on a.id_brand=b.id_brand
join category c
on a.id_Category=c.id_category
join condition d
on a.id_condition= d.id_condition
join Shipping_type e
on a.id_shipping_Type=e.id_shipping_type
join status f
on a.id_status=f.id_status
where f.id_status=0 and  a.name= NVL(pName, a.name) and d.id_condition= NVL(pidCondition, d.id_condition) and b.id_brand = NVL(pidbrand, b.id_brand) 
and e.id_shipping_type= NVL(pidShipping, e.id_shipping_type)and c.id_category= NVL(pidCategory, c.id_category) and  a.model= NVL(pmodel, a.model) and a.id_clock= NVL(pid_clock,a.id_clock) and a.price= NVL(pPrice, a.price);
return vcCursor;
end;



function UserBuyHistory(pidUser number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select c.id_clock, c.name, c.model, c.description, c.price, c.manifacturing_Date
from person a
join person_buy_clock b
on a.id_person=b.id_person
join clock c
on b.id_clock=c.id_Clock
where pidUser=a.id_person;
return vcCursor;
end;



function UserSellHistory (pidUser number,pid_status number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select c.id_clock, c.name, c.model, c.description, c.price, c.manifacturing_Date, d.description
from person a
join personsellclock b
on a.id_person=b.id_person
join clock c
on b.id_clock=c.id_Clock
join status d
on c.id_Status=d.id_Status
where pidUser=a.id_person  and d.id_status= NVL(pid_status, d.id_status) ;
return vcCursor;
end;


function  ExpensivePruchaseCatergory(pidUser number, pidCategory number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select c.id_clock, c.name, c.model, c.description, c.price, c.manifacturing_Date, d.description
from person a
join person_buy_clock b
on a.id_person=b.id_person
join clock c
on b.id_clock=c.id_Clock
join category d
on c.id_Status=c.id_Status
where pidUser=a.id_person  and d.id_category= NVL(pidCategory, d.id_category) and c.price>=600 ;
return vcCursor;
end;



end;