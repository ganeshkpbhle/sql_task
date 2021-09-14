use students;
#create table artist_movie(artist_id int,movie_id int,artist_role int
#,foreign key(artist_id)references Artist(artist_id),foreign key(movie_id)references Movies(movie_id),foreign key(artist_role)references skill(skill_id)); 
/*
insert into clip values("video1.mp4",55231);
insert into clip values("video2.mp4",55234);
insert into clip values("video3.mp4",55234);
insert into clip values("video4.mp4",55242);
insert into clip values("video5.mp4",55239);
insert into clip values("video6.mp4",55245);
insert into clip values("video7.mp4",55238);
insert into clip values("video8.mp4",55238);

insert into pic values("1.jpg",55233);
insert into pic values("2.jpg",55234);
insert into pic values("3.jpg",55243);
insert into pic values("4.jpg",55245);
insert into pic values("5.jpg",55239);
insert into pic values("6.jpg",55231);
insert into pic values("7.jpg",55236);
insert into pic values("8.jpg",55238);
insert into pic values("9.jpg",55242);
insert into pic values("11.jpg",55239);

insert into artist_skill values(2214,13);
insert into artist_skill values(2214,14);
insert into artist_skill values(2215,12);
insert into artist_skill values(2215,11);
insert into artist_skill values(2216,12);
insert into artist_skill values(2217,12);
insert into artist_skill values(2218,12);
insert into artist_skill values(2218,11);
insert into artist_skill values(2219,12);

insert into genre_type values(55231,1);
insert into genre_type values(55233,1);
insert into genre_type values(55233,2);
insert into genre_type values(55234,1);
insert into genre_type values(55236,1);
insert into genre_type values(55236,2);
insert into genre_type values(55238,1);
insert into genre_type values(55239,1);
insert into genre_type values(55242,2);
insert into genre_type values(55243,1);
insert into genre_type values(55245,2);
insert into genre_type values(55245,3);

insert into cast_ values(2219,55231,"Murph");
insert into cast_ values(2218,55231,"cooper");
insert into cast_ values(2219,55239,"Captain");
insert into cast_ values(2216,55239,"Commander");
insert into cast_ values(2215,55236,"Bill");
insert into cast_ values(2217,55236,"Emily");

insert into artist_movie values(2214,55231,13);
insert into artist_movie values(2214,55231,14);
insert into artist_movie values(2218,55231,12);
insert into artist_movie values(2219,55231,15);
insert into artist_movie values(2215,55236,12);
insert into artist_movie values(2217,55236,15);
insert into artist_movie values(2216,55231,12);
insert into artist_movie values(2216,55239,12);
insert into artist_movie values(2215,55242,12);
insert into cast_ values(2216,55231,"Dr.Mann");
#*/
#1.
select m.movie_name,m.released_date,cp.clip_file_name,p.Image_file_name from  
(movies as m inner join clip as cp on cp.movie_id=m.movie_id)
inner join pic as p on p.movie_id=m.movie_id; 
#2.
select movie_name,released_date,user_name,Rating_out_of_5,c.clip_file_name 
from ((movies as m inner join Reviews as R on R.movie_id=m.movie_id)
inner join Users as u on u.user_id=R.user_id)inner join clip as c on c.movie_id=m.movie_id;
#3.
select movie_name,released_date,skill_name as Artist_role,role_ from 
((movies as m inner join artist_movie as am on am.movie_id=m.movie_id) 
inner join skill as sk on sk.skill_id=am.artist_role)
left join cast_ on cast_.artist_id=am.artist_id;

#4.
select user_name,movie_name,Rating_out_of_5 from (movies as m inner join Reviews as R on R.movie_id=m.movie_id)
inner join Users as u on u.user_id=R.user_id;

#5.
select artist_name,skill_name from (Artist as A inner join artist_skill as ak on A.artist_id=ak.artist_id)
left join skill as s on s.skill_id=ak.skill_id; 
#6.
select artist_name,movie_name,released_date,skill_name as Role_ from ((Artist as A inner join artist_movie as am on am.artist_id=A.artist_id)
inner join movies as m on m.movie_id=am.movie_id)inner join skill on skill.skill_id=am.artist_role where artist_name='CrystopherNolan'; 