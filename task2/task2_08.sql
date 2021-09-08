#drop database students;
#create database students;
use students;
#1.creating tables
/*
create table users (user_id int not null,user_name varchar(45) not null,user_mail varchar(20)
,primary key(user_id));

create table mentor (mentor_id int not null,mentor_name varchar(20),primary key(mentor_id));
create table courses (course_id int not null,course_name varchar(10),mentor_assigned int
,primary key(course_id),foreign key(mentor_assigned) references mentor(mentor_id));

create table topics(topic_id int,topic_name varchar(15),course_id int,primary key(topic_id),foreign key(course_id) references courses(course_id));

create table date_tb(date_ date,topic_id int,primary key(date_),foreign key(topic_id) references topics(topic_id));

create table codekata (problem_category int not null,solved_no int not null,user_id int
,foreign key(user_id) references users(user_id),foreign key(problem_category) references topics(topic_id));

create table attendence(topic_id int,person_id int,date_ date not null,status_ char(1)
,foreign key(person_id) references users(user_id),foreign key(topic_id) references topics(topic_id),foreign key(date_) references date_tb(date_));


create table tasks(task_name varchar(20),student_id int,topic_id int,status_ char(1),assigned_date date
,foreign key(student_id) references users(user_id)
,foreign key(topic_id) references topics(topic_id),foreign key(assigned_date) references date_tb(date_));

create table company_drives (user_id int,company_name varchar(10),commenced_date date
,foreign key(user_id) references users(user_id));

create table student_activated_course(user_id int,course_id int
,foreign key(user_id) references users(user_id)
,foreign key(course_id) references courses(course_id));
#*/
#2.inserting into all tables % 5 Rows
/*
insert into users values(1120,"henderson","henderson@chubb.in");
insert into users values(1320,"mike","mike230@chubb.in");
insert into users values(6363,"lucas","lucas44@chubb.in");
insert into users values(5532,"venkat","venkatsu@chubb.in");
insert into users values(8837,"pheobe","pheeebs@chubb.in");
insert into users values(7883,"joey","tribiani34@chubb.in");
insert into users values(8832,"hushel","hushel11@chubb.in");
insert into users values(9922,"tom","cruise38@chubb.in");

insert into mentor values(773,"karthick");
insert into mentor values(453,"Geller");
insert into mentor values(662,"sheldon");
insert into mentor values(883,"Elon");
insert into mentor values(221,"howard");
insert into mentor values(992,"leonard");

insert into courses values(463,".NET",773);
insert into courses values(773,"JS",453);
insert into courses values(332,"Ang.js",662);
insert into courses values(632,"Node.js",883);
insert into courses values(774,"MangoDB",221);
insert into courses values(838,"SQL",992);

insert into topics values(23,"basics",463);
insert into topics values(22,"intro",332);
insert into topics values(21,"express",632);
insert into topics values(20,"forward/dir",632);
insert into topics values(10,"framewrk",463);
insert into topics values(24,"elements",332);
insert into topics values(73,"c##",463);
insert into topics values(32,"hoist",773);
insert into topics values(11,"req/resp",332);
insert into topics values(77,"deploy",774);
insert into topics values(93,"launchweb",332);

insert into date_tb values(STR_TO_DATE('26-10-2021', '%d-%m-%Y'),20);
insert into date_tb values(STR_TO_DATE('27-10-2021', '%d-%m-%Y'),21);
insert into date_tb values(STR_TO_DATE('28-10-2021', '%d-%m-%Y'),22);
insert into date_tb values(STR_TO_DATE('29-10-2021', '%d-%m-%Y'),23);
insert into date_tb values(STR_TO_DATE('30-10-2021', '%d-%m-%Y'),24);
insert into date_tb values(STR_TO_DATE('31-10-2021', '%d-%m-%Y'),32);
insert into date_tb values(STR_TO_DATE('01-11-2021', '%d-%m-%Y'),11);
insert into date_tb values(STR_TO_DATE('02-11-2021', '%d-%m-%Y'),77);
insert into date_tb values(STR_TO_DATE('03-11-2021', '%d-%m-%Y'),93);
insert into date_tb values(STR_TO_DATE('04-11-2021', '%d-%m-%Y'),10);
insert into date_tb values(STR_TO_DATE('05-11-2021', '%d-%m-%Y'),73);

insert into codekata values(24,1,1320);
insert into codekata values(21,2,1120);
insert into codekata values(10,2,7883);
insert into codekata values(73,4,8832);
insert into codekata values(11,4,9922);
insert into codekata values(77,3,5532);
insert into codekata values(22,3,6363);
insert into codekata values(93,1,5532);

insert into attendence values(20,1120,STR_TO_DATE('26-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(20,1320,STR_TO_DATE('26-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(20,6363,STR_TO_DATE('26-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(20,5532,STR_TO_DATE('26-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(20,8837,STR_TO_DATE('26-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(20,7883,STR_TO_DATE('26-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(20,8832,STR_TO_DATE('26-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(20,9922,STR_TO_DATE('26-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(21,1120,STR_TO_DATE('27-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(21,1320,STR_TO_DATE('27-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(21,6363,STR_TO_DATE('27-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(21,5532,STR_TO_DATE('27-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(21,8837,STR_TO_DATE('27-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(21,7883,STR_TO_DATE('27-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(21,8832,STR_TO_DATE('27-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(21,9922,STR_TO_DATE('27-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(22,1120,STR_TO_DATE('28-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(22,1320,STR_TO_DATE('28-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(22,6363,STR_TO_DATE('28-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(22,5532,STR_TO_DATE('28-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(22,8837,STR_TO_DATE('28-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(22,7883,STR_TO_DATE('28-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(22,8832,STR_TO_DATE('28-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(22,9922,STR_TO_DATE('28-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(23,1120,STR_TO_DATE('29-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(23,1320,STR_TO_DATE('29-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(23,6363,STR_TO_DATE('29-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(23,5532,STR_TO_DATE('29-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(23,8837,STR_TO_DATE('29-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(23,7883,STR_TO_DATE('29-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(23,8832,STR_TO_DATE('29-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(23,9922,STR_TO_DATE('29-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(24,1120,STR_TO_DATE('30-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(24,1320,STR_TO_DATE('30-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(24,6363,STR_TO_DATE('30-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(24,5532,STR_TO_DATE('30-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(24,8837,STR_TO_DATE('30-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(24,7883,STR_TO_DATE('30-10-2021', '%d-%m-%Y'),'y');
insert into attendence values(24,8832,STR_TO_DATE('30-10-2021', '%d-%m-%Y'),'n');
insert into attendence values(24,9922,STR_TO_DATE('30-10-2021', '%d-%m-%Y'),'y');


insert into company_drives values(7883,"chubb",STR_TO_DATE('22-10-2021', '%d-%m-%Y'));
insert into company_drives values(8837,"chubb",STR_TO_DATE('16-10-2021', '%d-%m-%Y'));
insert into company_drives values(9922,"chubb",STR_TO_DATE('15-10-2021', '%d-%m-%Y'));
insert into company_drives values(5532,"chubb",STR_TO_DATE('14-10-2021', '%d-%m-%Y'));
insert into company_drives values(5532,"wipro",STR_TO_DATE('10-10-2021', '%d-%m-%Y'));
insert into company_drives values(8832,"cts",STR_TO_DATE('29-10-2021', '%d-%m-%Y'));
insert into company_drives values(8832,"chubb",STR_TO_DATE('01-11-2021', '%d-%m-%Y'));
insert into company_drives values(7883,"cts",STR_TO_DATE('02-11-2021', '%d-%m-%Y'));

insert into tasks values("routing pages",1120,20,'y',STR_TO_DATE('26-10-2021', '%d-%m-%Y'));
insert into tasks values("routing pages",1320,20,'y',STR_TO_DATE('26-10-2021', '%d-%m-%Y'));
insert into tasks values("routing pages",6363,20,'n',STR_TO_DATE('26-10-2021', '%d-%m-%Y'));
insert into tasks values("routing pages",5532,20,'y',STR_TO_DATE('26-10-2021', '%d-%m-%Y'));
insert into tasks values("routing pages",8837,20,'y',STR_TO_DATE('26-10-2021', '%d-%m-%Y'));
insert into tasks values("routing pages",7883,20,'n',STR_TO_DATE('26-10-2021', '%d-%m-%Y'));
insert into tasks values("routing pages",8832,20,'n',STR_TO_DATE('26-10-2021', '%d-%m-%Y'));
insert into tasks values("routing pages",9922,20,'y',STR_TO_DATE('26-10-2021', '%d-%m-%Y'));
insert into tasks values("express code",1120,21,'y',STR_TO_DATE('27-10-2021', '%d-%m-%Y'));
insert into tasks values("express code",1320,21,'y',STR_TO_DATE('27-10-2021', '%d-%m-%Y'));
insert into tasks values("express code",6363,21,'n',STR_TO_DATE('27-10-2021', '%d-%m-%Y'));
insert into tasks values("express code",5532,21,'y',STR_TO_DATE('27-10-2021', '%d-%m-%Y'));
insert into tasks values("express code",8837,21,'n',STR_TO_DATE('27-10-2021', '%d-%m-%Y'));
insert into tasks values("express code",7883,21,'y',STR_TO_DATE('27-10-2021', '%d-%m-%Y'));
insert into tasks values("express code",8832,21,'y',STR_TO_DATE('27-10-2021', '%d-%m-%Y'));
insert into tasks values("express code",9922,21,'n',STR_TO_DATE('27-10-2021', '%d-%m-%Y'));
insert into tasks values("insert/delete",1120,22,'y',STR_TO_DATE('28-10-2021', '%d-%m-%Y'));
insert into tasks values("insert/delete",1320,22,'y',STR_TO_DATE('28-10-2021', '%d-%m-%Y'));
insert into tasks values("insert/delete",6363,22,'n',STR_TO_DATE('28-10-2021', '%d-%m-%Y'));
insert into tasks values("insert/delete",5532,22,'y',STR_TO_DATE('28-10-2021', '%d-%m-%Y'));
insert into tasks values("insert/delete",8837,22,'y',STR_TO_DATE('28-10-2021', '%d-%m-%Y'));
insert into tasks values("insert/delete",7883,22,'y',STR_TO_DATE('28-10-2021', '%d-%m-%Y'));
insert into tasks values("insert/delete",8832,22,'n',STR_TO_DATE('28-10-2021', '%d-%m-%Y'));
insert into tasks values("insert/delete",9922,22,'y',STR_TO_DATE('28-10-2021', '%d-%m-%Y'));
insert into tasks values("deployment",1120,23,'n',STR_TO_DATE('29-10-2021', '%d-%m-%Y'));
insert into tasks values("deployment",1320,23,'y',STR_TO_DATE('29-10-2021', '%d-%m-%Y'));
insert into tasks values("deployment",6363,23,'y',STR_TO_DATE('29-10-2021', '%d-%m-%Y'));
insert into tasks values("deployment",5532,23,'y',STR_TO_DATE('29-10-2021', '%d-%m-%Y'));
insert into tasks values("deployment",8837,23,'y',STR_TO_DATE('29-10-2021', '%d-%m-%Y'));
insert into tasks values("deployment",7883,23,'n',STR_TO_DATE('29-10-2021', '%d-%m-%Y'));
insert into tasks values("deployment",8832,23,'y',STR_TO_DATE('29-10-2021', '%d-%m-%Y'));
insert into tasks values("deployment",9922,23,'n',STR_TO_DATE('29-10-2021', '%d-%m-%Y'));

insert into student_activated_course values(5532,463);
insert into student_activated_course values(8832,463);
insert into student_activated_course values(1320,773);
insert into student_activated_course values(6363,632);
insert into student_activated_course values(9922,774);
insert into student_activated_course values(7883,774);
insert into student_activated_course values(5532,632);
insert into student_activated_course values(8832,632);
insert into student_activated_course values(1320,774);
insert into student_activated_course values(7883,838);
insert into student_activated_course values(6363,838);
insert into student_activated_course values(1320,632);
insert into student_activated_course values(1120,332);
insert into student_activated_course values(1120,773);
insert into student_activated_course values(9922,773);
insert into student_activated_course values(9922,463);

insert into student_activated_course values(5532,838);
insert into student_activated_course values(8832,773);
insert into student_activated_course values(1320,838);
insert into student_activated_course values(6363,774);
insert into student_activated_course values(9922,632);
insert into student_activated_course values(7883,632);
insert into student_activated_course values(5532,774);
insert into student_activated_course values(8832,774);
#insert into student_activated_course values(1320,838);
#insert into student_activated_course values(7883,773);
#insert into student_activated_course values(6363,773);
#insert into student_activated_course values(1320,632);
#insert into student_activated_course values(1120,332);
#insert into student_activated_course values(1120,773);
#insert into student_activated_course values(9922,773);
#insert into student_activated_course values(9922,463);

#*/

#task1 07-09-2021
/*
#3.number of problems solved in codekata combining users
select users.user_id,users.user_name,codekata.solved_no as no_of_pblmsolved,(select topic_name from topics where topic_id=codekata.problem_category) as topics_ 
from users inner join codekata on users.user_id=codekata.user_id;

#4.number of company drives attended
select users.user_id,users.user_name,count(*) attended from users inner join company_drives on 
users.user_id=company_drives.user_id group by users.user_id;

#5.combine and display students_activated_course and courses group by courses
select courses.course_id,courses.course_name,count(*)students_activated_count from 
student_activated_course inner join courses on 
courses.course_id=student_activated_course.course_id group by courses.course_id;

#6.listing all mentors
select * from mentor;

#7.list number of students assigned for each mentor
select m.mentor_id,m.mentor_name,count(*) assigned_students_count from
(mentor as m inner join courses as cs on m.mentor_id=cs.mentor_assigned) inner join student_activated_course as sac on cs.course_id=sac.course_id 
group by m.mentor_id having assigned_students_count>=2;
#*/

#task2 08-09-2021
#1.topics and tasks given in october
select t.topic_name as topic_taken,tsk.task_name,tsk.assigned_date,tsk.status_ as task_completed from 
tasks as tsk inner join topics as t on t.topic_id=tsk.topic_id where month(tsk.assigned_date)=10;

#2.company drives between 15-oct-2021 to 31-oct-2021
select company_name,commenced_date from company_drives where(commenced_date between '2021-10-15' and '2021-10-31'); 

#3.all students and company drives list
select * from company_drives;

#4.number of problems solved by users codekata
select users.user_id,users.user_name,codekata.solved_no as no_of_pblmsolved
,(select topic_name from topics where topic_id=codekata.problem_category) as topics_ 
from users inner join codekata on users.user_id=codekata.user_id;

#5.number of mentors having mentees greater than 6
select m.mentor_id,m.mentor_name,count(*) assigned_students_count from
(mentor as m inner join courses as cs on m.mentor_id=cs.mentor_assigned) inner join student_activated_course as sac on cs.course_id=sac.course_id 
group by m.mentor_id having assigned_students_count>=4;

#6.number of students absent and not submitted task between 15-oct-2021 to 31-oct-2021
select users.user_name,att.date_,att.status_ from (users inner join attendence as att on users.user_id=att.person_id) 
inner join tasks as tsk on tsk.topic_id=att.topic_id where tsk.status_='n' and att.status_='n';