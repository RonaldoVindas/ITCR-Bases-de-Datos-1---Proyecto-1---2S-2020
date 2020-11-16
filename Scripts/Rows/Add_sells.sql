---Nuevos Alters
alter table person modify (id_person number(9));
alter table clock modify (manifacturing_date number(4));
alter table clock modify (model varchar2(50));
alter table clock modify (name varchar2(100));
alter table clock modify (description varchar2(500));
---

alter table personsellClock modify (id_person number(9));
alter table personsellClock modify (id_person number(9));
alter table person_buy_Clock modify (id_person number(9));
alter table personwishclock modify (id_person number(9));
alter table personwishclock modify (id_person number(9));
alter table personxphone  modify (id_person number(9));
alter table personchatperson modify (id_person1 number(9), id_person2 number(9));



---

insert into personsellclock(id_person, id_clock) values(117820091,1);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 0;
	COMMIT;
    

insert into personsellclock(id_person, id_clock) values(117820091,30);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 0;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(217820091,2);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 2;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(217820091,3);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 3;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(217820091,4);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 4;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(617820091,5);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 5;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(617820091,6);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 6;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(517820091,7);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 7;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(517820091,8);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 8;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(517820091,9);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 9;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(717820091,10);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 00;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(717820091,11);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 01;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(717820091,12);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 02;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(717820091,13);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 03;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(717820091,14);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 04;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(917820091,15);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 05;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(917820091,16);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 06;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(417820091,17);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 07;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(417820091,18);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 08;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(417820091,19);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 09;
	COMMIT;
    


    insert into personsellclock(id_person, id_clock) values(417820091,20);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 20;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(317820091,21);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 21;
	COMMIT;
    insert into personsellclock(id_person, id_clock) values(317820091,22);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 22;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(317820091,23);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 23;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(317820091,24);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 24;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(117820091,25);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 25;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(117820091,26);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 26;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(117820091,27);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 27;
	COMMIT;
    
    insert into personsellclock(id_person, id_clock) values(117820091,28);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 28;
	COMMIT;
    
    
   insert into personsellclock(id_person, id_clock) values(517820091,29);

UPDATE clock
	SET id_status = 0
	WHERE id_clock = 29;
	COMMIT;
    
    
--------------------------------------------------------------------------------------------------------------------------------------------

insert into person_buy_clock(id_person,id_clock, id_pay_method) values(817820091,14,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 14;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(817820091,15,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 15;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(817820091,16,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 16;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(817820091,17,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 17;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(817820091,18,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 18;
	COMMIT;

---
insert into person_buy_clock(id_person,id_clock, id_pay_method) values(917820091,2,1);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 2;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(917820091,7,1);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 7;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(317820091,28,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 28;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(517820091,27,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 27;
	COMMIT;
--

insert into person_buy_clock(id_person,id_clock, id_pay_method) values(317820091,23,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 23;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(217820091,5,1);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 4;
	COMMIT;
--

insert into person_buy_clock(id_person,id_clock, id_pay_method) values(617820091,25,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 25;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(617820091,20,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 20;
	COMMIT;

--
insert into person_buy_clock(id_person,id_clock, id_pay_method) values(117820091,8,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 8;
	COMMIT;
--

insert into person_buy_clock(id_person,id_clock, id_pay_method) values(917820091,22,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 22;
	COMMIT;
--

insert into person_buy_clock(id_person,id_clock, id_pay_method) values(417820091,10,1);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 10;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(417820091,5,1);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 5;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(417820091,21,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 21;
	COMMIT;
----

insert into person_buy_clock(id_person,id_clock, id_pay_method) values(217820091,19,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 19;
	COMMIT;


insert into person_buy_clock(id_person,id_clock, id_pay_method) values(917820091,26,0);
UPDATE clock
	SET id_status = 1
	WHERE id_clock = 26;
	COMMIT;

