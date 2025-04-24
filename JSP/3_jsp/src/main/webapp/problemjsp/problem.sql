create table problem(
p_id varchar2(4000) primary key,
problem varchar2(4000),
solve varchar2(4000)
);

drop table problem

insert into problem values('1','IP주소를 MAC 주소로 변환해줌','ARP');


select * from problem;

select * from problem where rownum = 1