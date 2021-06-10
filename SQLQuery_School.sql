create database sportdb
use sportdb

create table sport( spid varchar(4), sname varchar(30), incharge varchar(30), place varchar(20), primary key(spid))

create table student( sid varchar(4), fname varchar(20), lname varchar(20), dob date, gender varchar(1), contact varchar(10),
					grade int, primary key (sid))

create table attendance(sid varchar(4), spid varchar(4), hours int, primary key(sid, spid), foreign key(sid) references student(sid),
				foreign key(spid) references sport(spid))

select * from sport

select * from student

select * from attendance

select * from student where fname='kalana' and lname ='weerathunga'

select incharge from sport where sname ='swimming'

select fname, lname, contact, sname from sport s, student ss, attendance a where s.spid= a.spid and ss.sid= a.sid and sname ='cricket'

select fname, sname from sport s, student ss, attendance a where s.spid = a.spid and ss.sid = a.sid and grade = 10

select fname, Dob, contact from sport s, student ss, attendance a where s.spid =a.spid and ss.sid = a.sid and sname = 'badminton'

select sname, hours from sport s, student ss, attendance a where s.spid =a.spid and ss.sid = a.sid and grade=6 and fname='pawani'

select fname, lname hours from sport s, student ss, attendance a where s.spid =a.spid and ss.sid = a.sid and
					hours>= 6 and sname ='swimming'

select fname, dob from sport s, student ss, attendance a where s.spid =a.spid and ss.sid = a.sid and sname='cricket'
	and dob> '2002/1/1'

select sname, count(fname) as 'number of std play' from sport s, student ss, attendance a where s.spid =a.spid 
	and ss.sid = a.sid  group by sname

alter table student add address varchar(20)

update student set contact= '0778827752' where grade =10 and fname ='dasun'

update student set address = 'piliyandala' where fname ='dinithi'

sp_rename 'sport.spid' , 'scode', 'column'

select sname from sport s, student ss, attendance a where s.scode= a.spid and ss.sid= a.sid and fname ='amila'

alter table student check constraint all

alter table sport check constraint all

alter table attendance check constraint all

delete from student   where sid = '1728' 
delete from sport where scode = 'kar'

SELECT @@SERVERNAME