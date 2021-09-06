use students;
#1.creating tables
/*
create table mentor (mentor_id int not null,mentor_name varchar(20),primary key(mentor_id));

create table users (user_id int not null,user_name varchar(45) not null,user_mail varchar(20)
,mentor_assigned int,primary key(user_id),foreign key(mentor_assigned) references mentor(mentor_id));

create table codekata (problem_category varchar(20) not null,solved_no int not null,user_id int
,foreign key(user_id) references users(user_id));

create table attendence(student_name varchar(20),percent decimal(2,0));

create table topics(topic_name varchar(15),covered_date date);

create table tasks(task_name varchar(15),from_date date,to_date date);

create table company_drives (user_id int,company_name varchar(10)
,foreign key(user_id) references users(user_id));
create table courses (course_id int not null,course_name varchar(10),primary key(course_id));
create table student_activated_course(user_id int,course_id int
,foreign key(user_id) references users(user_id)
,foreign key(course_id) references courses(course_id));*/


#2.inserting into all tables % 5 Rows
/*
#mentor
insert into mentor values(500,"ayyapan");
insert into mentor values(406,"karthikeyan");
insert into mentor values(508,"khogle");
insert into mentor values(467,"falcon");
insert into mentor values(498,"angle");
#users
insert into users (user_id,user_name,user_mail,mentor_assigned) values (120,"falcon","falcon@123.com",406);
insert into users (user_id,user_name,mentor_assigned) values (118,"joey",500);
insert into users (user_id,user_name,user_mail,mentor_assigned) values (107,"franky","franky@fidel2.com",500);
insert into users (user_id,user_name,user_mail,mentor_assigned) values (134,"henderson","hendersen@hbk.in",467);
insert into users (user_id,user_name,user_mail,mentor_assigned) values (109,"baldeagle","bgk@145.co.in",498);
#codekata
insert into codekata (problem_category,solved_no,user_id) values ("array",10,107);
insert into codekata (problem_category,solved_no,user_id) values ("strings",2,107);
insert into codekata (problem_category,solved_no,user_id) values ("basic",20,118);
insert into codekata (problem_category,solved_no,user_id) values ("array",12,134);
insert into codekata (problem_category,solved_no,user_id) values ("back-tracking",5,134);

#company drives 
insert into company_drives values (107,"chubb");
insert into company_drives values (134,"chubb");
insert into company_drives values (109,"cts");
insert into company_drives values (134,"zoho");
insert into company_drives values (118,"wipro");
insert into company_drives values (107,"zoho");
insert into company_drives values (118,"chubb");
insert into company_drives values (134,"cts");
insert into company_drives values (109,"chubb");

#inserting values in courses
insert into courses values(234,"java");
insert into courses values(256,"Angular.js");
insert into courses values(200,"javascript");
insert into courses values(305,"c++");
insert into courses values(300,"c##");
insert into courses values(404,"c");
insert into courses values(500,"python");
insert into courses values(100,".net");

#inserting values in activated _courses
insert into student_activated_course values(120,200);
insert into student_activated_course values(134,305);
insert into student_activated_course values(118,100);
insert into student_activated_course values(120,300);
insert into student_activated_course values(134,100);
insert into student_activated_course values(109,500);
insert into student_activated_course values(107,404);
insert into student_activated_course values(118,256);*/

#3.number of problems solved in codekata combining users
select users.user_id,users.user_name,codekata.solved_no as no_of_pblmsolved,codekata.problem_category from users inner join codekata on users.user_id=codekata.user_id;

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
select mentor.mentor_id,mentor.mentor_name,count(*) assigned_students_count from 
mentor inner join users on mentor.mentor_id=users.mentor_assigned group by mentor.mentor_id;