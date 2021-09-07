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

create table codekata (problem_category int not null,solved_no int not null,user_id int
,foreign key(user_id) references users(user_id),foreign key(problem_category) references topics(topic_id));
create table attendence(topic_id int,person_id int,date_ date,status_ char(1)
,foreign key(person_id) references users(user_id),foreign key(topic_id) references topics(topic_id));

create table tasks(student_id int,topic_id int,status_ char(2)
,foreign key(student_id) references users(user_id)
,foreign key(topic_id) references topics(topic_id));

create table company_drives (user_id int,company_name varchar(10)
,foreign key(user_id) references users(user_id));

create table student_activated_course(user_id int,course_id int
,foreign key(user_id) references users(user_id)
,foreign key(course_id) references courses(course_id));
*/
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

insert into codekata values(24,1,1320);
insert into codekata values(21,2,1120);
insert into codekata values(10,2,7883);
insert into codekata values(73,4,8832);
insert into codekata values(11,4,9922);
insert into codekata values(77,3,5532);
insert into codekata values(22,3,6363);
insert into codekata values(93,1,5532);

insert into attendence values(20,5532,STR_TO_DATE('07-07-2021', '%m-%d-%Y'),'y');
insert into attendence values(10,5532,STR_TO_DATE('08-07-2021', '%m-%d-%Y'),'n');
insert into attendence values(11,1120,STR_TO_DATE('07-08-2021', '%m-%d-%Y'),'y');
insert into attendence values(77,8837,STR_TO_DATE('09-07-2021', '%m-%d-%Y'),'n');
insert into attendence values(93,1120,STR_TO_DATE('10-07-2021', '%m-%d-%Y'),'y');
insert into attendence values(21,1320,STR_TO_DATE('10-07-2021', '%m-%d-%Y'),'y');
insert into attendence values(23,6363,STR_TO_DATE('09-07-21', '%m-%d-%Y'),'y');
insert into attendence values(22,1320,STR_TO_DATE('08-07-21', '%m-%d-%Y'),'n');

insert into company_drives values(7883,"chubb");
insert into company_drives values(8837,"chubb");
insert into company_drives values(9922,"chubb");
insert into company_drives values(5532,"chubb");
insert into company_drives values(5532,"wipro");
insert into company_drives values(8832,"cts");
insert into company_drives values(8832,"chubb");
insert into company_drives values(7883,"cts");

insert into tasks values(5532,22,"cm");
insert into tasks values(8832,21,'cm');
insert into tasks values(7883,20,'ic');
insert into tasks values(9922,24,'cm');
insert into tasks values(5532,23,'cm');
insert into tasks values(1120,11,'ic');
insert into tasks values(1320,73,'cm');
insert into tasks values(6363,77,'ic');
insert into tasks values(9922,93,'cm');


insert into student_activated_course values(5532,463);
insert into student_activated_course values(8832,463);
insert into student_activated_course values(1320,773);
insert into student_activated_course values(6363,632);
insert into student_activated_course values(9922,774);
insert into student_activated_course values(7883,774);
insert into student_activated_course values(5532,632);
*/
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
(mentor as m inner join courses as cs on m.mentor_id=cs.mentor_assigned) inner join student_activated_course as sac on cs.course_id=sac.course_id group by m.mentor_id;