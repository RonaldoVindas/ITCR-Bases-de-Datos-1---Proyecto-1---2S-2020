ALTER TABLE personxreview
ADD id_person_reviewed number(9);

ALTER TABLE personxreview
ADD CONSTRAINT fk__person_reviewed FOREIGN KEY
(id_person_reviewed) REFERENCES person(id_person); /**/





insert into personwishclock(id_person, id_clock) values(417820091,   1 );
insert into personwishclock(id_person, id_clock) values(417820091,   2 );



insert into personwishclock(id_person, id_clock) values(317820091,   9 );
insert into personwishclock(id_person, id_clock) values(317820091,   3 );
insert into personwishclock(id_person, id_clock) values(317820091,   11 );


insert into personwishclock(id_person, id_clock) values(217820091,   12 );
insert into personwishclock(id_person, id_clock) values(217820091,   1 );

insert into personwishclock(id_person, id_clock) values(117820091,   24 );


insert into personwishclock(id_person, id_clock) values(717820091,   29 );
insert into personwishclock(id_person, id_clock) values(917820091,   1 );


--sellers----
alter table personxreview modify( id_person number(9));
insert into review(stars) values(5);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(817820091,0,717820091, 'Perfect, nothing to say');
insert into reviewxreview_type(id_review, id_review_type) values (0,1);



insert into review(stars) values(5);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(817820091,1,917820091, 'Watch arrives in time');
insert into reviewxreview_type(id_review, id_review_type) values (1,1);


insert into review(stars) values(5);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(917820091,2,217820091, 'Excellent purchase');
insert into reviewxreview_type(id_review, id_review_type) values (2,1);




insert into review(stars) values(5);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(917820091,3,117820091, 'Good comunication');
insert into reviewxreview_type(id_review, id_review_type) values (3,1);




insert into review(stars) values(5);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(417820091,4,617820091, 'everything fine');
insert into reviewxreview_type(id_review, id_review_type) values (4,1);



insert into review(stars) values(5);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(617820091,5,417820091, '10/10');
insert into reviewxreview_type(id_review, id_review_type) values (5,1);

insert into review(stars) values(4);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(417820091,6,717820091, 'Satisfactory');
insert into reviewxreview_type(id_review, id_review_type) values (6,1);


insert into review(stars) values(4);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(217820091,7,617820091, 'not perfect but fine');
insert into reviewxreview_type(id_review, id_review_type) values (7,1);


insert into review(stars) values(2);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(417820091,8,317820091, 'so many problems, not recomended');
insert into reviewxreview_type(id_review, id_review_type) values (8,1);


insert into review(stars) values(3);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(917820091,9,117820091, 'some problems but finally i get my watch');
insert into reviewxreview_type(id_review, id_review_type) values (9,1);


--------buyers--------
insert into review(stars) values(4);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(117820091,10,517820091, 'everything normal');
insert into reviewxreview_type(id_review, id_review_type) values (10,0);


insert into review(stars) values(1);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(317820091,11,417820091, 'DONT SELL TO THIS PERSON');
insert into reviewxreview_type(id_review, id_review_type) values (11,0);


insert into review(stars) values(3);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(317820091,12,917820091, 'some problems with the payment');
insert into reviewxreview_type(id_review, id_review_type) values (12,0);


insert into review(stars) values(4);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(417820091,13,917820091, 'good comunication');
insert into reviewxreview_type(id_review, id_review_type) values (13,0);


insert into review(stars) values(4);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(717820091,14,817820091,'all good ');
insert into reviewxreview_type(id_review, id_review_type) values (14,0);


insert into review(stars) values(5);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(917820091,15,817820091, 'she give me a tip ');
insert into reviewxreview_type(id_review, id_review_type) values (15,0);


insert into review(stars) values(4);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(917820091,16,817820091, 'no tip this time');
insert into reviewxreview_type(id_review, id_review_type) values (16,0);


insert into review(stars) values(4);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(417820091,17,817820091, 'everything fine');
insert into reviewxreview_type(id_review, id_review_type) values (17,0);


insert into review(stars) values(3);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(717820091,18,417820091, 'some problems');
insert into reviewxreview_type(id_review, id_review_type) values (18,0);



insert into review(stars) values(4);
insert into personxreview(id_person,id_review, id_person_reviewed,user_comment) values(117820091,19,917820091, 'nice person');
insert into reviewxreview_type(id_review, id_review_type) values (19,0);
