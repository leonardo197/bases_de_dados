use db_inqueritos1

select *from inqueritos

select count(*) from inqueritos

select AVG(age) from inqueritos

select max(age) from inqueritos
select min(age) from inqueritos

select count(*),AVG(age) from Inqueritos where MaritalStatus=0 

select count(*),AVG(age) from Inqueritos where MaritalStatus=1
select MaritalStatus, count(*),AVG(age) from Inqueritos  group by MaritalStatus 

select Gender, count(*),AVG(age),min(age),max(age) from Inqueritos  group by Gender 


select MaritalStatus,Gender ,  count(*)'total' from Inqueritos  group by MaritalStatus,Gender order by Gender

select MaritalStatus,Gender ,wireless,  count(*)'total' from Inqueritos  group by MaritalStatus,Gender,wireless order by Gender

select count(*)from Inqueritos where education=3 and retired=0 and EmploymentCategory=3  