create or replace package admin_queries is
function topsellers(pNumber  in number) return sys_refcursor;
function topBuyers(pNumber in number)return sys_refcursor;
function bestQualifiedSellers return sys_refcursor;
function bestQualifiedBuyers return sys_refcursor;
function worstQualifiedSellers return sys_refcursor;
function worstQualifiedBuyers return sys_refcursor;
function MostExpensiveClocks(pNumber in number,pdescription in varchar) return sys_refcursor;
function MaxMinPerCategory(pdescription in varchar) return sys_refcursor;
end admin_queries;
/
CREATE OR REPLACE PACKAGE BODY admin_queries IS

function TopSellers(pNumber in number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select *
from(
Select a.First_name, a.Last_name, count(1)  sells
from person a
join personsellclock b
on a.id_person= b.id_person
join person_buy_clock c
on b.id_clock=c.id_clock
group by a.first_name, a.last_name  order by sells desc)
where rownum <= pNumber;
return vcCursor;
end;


function TopBuyers(pNumber in number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select *
from(
Select a.First_name, a.Last_name, count(1)  sells
from person a
join person_buy_clock b
on a.id_person=b.id_person
group by a.first_name, a.last_name  order by sells desc)
where rownum <= pNumber;
return vcCursor;
end;


 function BestQualifiedSellers
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select * 
from(
select a.First_name, a.Last_name, Sum(stars)/count(1) average
from person a
join personxreview b
on a.id_person=b.id_person
join review c
on b.id_review=c.id_review
join reviewxreview_type d
on c.id_review=d.id_review
where d.id_review_type=0
group by a.first_name, a.last_name  order by count(1) desc)
where rownum <= 15;
return vcCursor;
end;



 function BestQualifiedBuyers
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select * 
from(
select a.First_name, a.Last_name, Sum(stars)/count(1) average
from person a
join personxreview b
on a.id_person=b.id_person
join review c
on b.id_review=c.id_review
join reviewxreview_type d
on c.id_review=d.id_review
where d.id_review_type=1
group by a.first_name, a.last_name  order by count(1) desc)
where rownum <= 15;
return vcCursor;
end;



 function WorstQualifiedSellers
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select * 
from(
select a.First_name, a.Last_name, Sum(stars)/count(1) average
from person a
join personxreview b
on a.id_person=b.id_person
join review c
on b.id_review=c.id_review
join reviewxreview_type d
on c.id_review=d.id_review
where d.id_review_type=0
group by a.first_name, a.last_name  order by count(1) asc)
where rownum <= 15;
return vcCursor;
end;


function WorstQualifiedBuyers
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select * 
from(
select a.First_name, a.Last_name, Sum(stars)/count(1) average
from person a
join personxreview b
on a.id_person=b.id_person
join review c
on b.id_review=c.id_review
join reviewxreview_type d
on c.id_review=d.id_review
where d.id_review_type=1
group by a.first_name, a.last_name  order by count(1) asc)
where rownum <= 15;
return vcCursor;
end;

function MostExpensiveClocks(pNumber in number,pdescription in varchar)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select *
from(
select name, model, price
from clock a
join category b
on a.id_category=b.id_category
where b.description=pdescription
order by price desc)
where rownum <= pnumber;
return vcCursor;
end;



function MaxMinPerCategory(pdescription in varchar)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select max(a.price), min(price), a.name
from clock a
join category b
on a.id_category=b.id_category
where b.description=pdescription;
return vcCursor;
end;

end admin_queries;


















