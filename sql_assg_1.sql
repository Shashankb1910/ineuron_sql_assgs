# ineuron assg1 q1
# Find the list of candidates which possess all the required skills. 

use shashank;

#creating table
create table skills(
id int,
techn varchar(50) not null
);

#inserting values
insert into skills values(1 ,'DS'),(1,'Python'),(1,'Powerbi'),(1,'SQL'),(2,'PowerBI'),(2,'Python'),(2,'SQL'),(2 ,'DS'),
(3,'PowerBI'),(3,'Python'),(3,'SQL');

select * from skills;

# soln
select id
from skills
group by id
having count(distinct techn) = (select count(distinct techn) from skills);

#-------------------------------------------------------------------------------------------

# ineuron assg1 q2
# Query to return Ids of two product info that has 0 likes.

#creating product_info table
create table prod_info(
prod_id int,
product varchar(25),
primary key(prod_id)
);

#inserting values into product_info
insert into prod_info values(1001, "Blog"),(1002,"Youtube"),(1003,"Education");

#creating prod_info_likes table
create table prod_info_likes(
user_id int,
prod_id int,
liked_date date,
foreign key(prod_id) references prod_info(prod_id)
);

#inserting into prod_info_likes table
insert into prod_info_likes values
(1,1001,"2023-08-25"),
(2,1003,"2023-07-18");

#soln
select pi.prod_id
from prod_info pi
left join prod_info_likes pil on pi.prod_id = pil.prod_id
group by pi.prod_id
having count(pil.prod_id) = 0