create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

with cte as 
(select team_1 as team , case 
when team_1 = winner then 1 else 0 end as win  from icc_world_cup 
union all
select team_2 as team , case 
when team_2 = winner then 1 else 0 end as win from icc_world_cup)
select team , count(team) as total_match , sum(win) as wins , count(team) - sum(win) as loss 
from cte group by team order by wins desc;



