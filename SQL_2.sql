--1
/*Display all data from Salgrade table.*/
select * from salgrade;

--2
/*Show data (name, department, salary) of all people who earn salaries < 1000,2000>.*/
select ename, deptno,sal
from emp
where sal between 1000 and 2000;

--3
/*From table Dept choose numbers and names of departments. Present data sorted by increasing numbers of departments.*/
select deptno,dname
from dept
order by deptno;

--4
/*Choose all different jobs.*/
select distinct job
from emp;

--5
/*Show all data about people working in departments 10 and 20 presenting data in alphabetic order of their jobs.*/
select * 
from emp
where deptno=10 or deptno=20
order by job;

--6
/*Find names of all people from department 20 working as CLERK*/
select ename
from emp
where job='CLERK' and deptno=20;

--7
/*Show the names of people who have in their names sequence "TH" or "LL" included.*/
select ename
from emp
where ename like('%LL%') or ename like('%TH%');

--8
/*Choose names and salaries of people with salaries not in <1000,2000> and names consisting of 5 characters.*/
select ename,sal
from emp
where sal not between 1000 and 2000 and length(ename)=5;

--9
/*Show names, jobs and salaries of people with names in which "L" doesn't occur and who earn salaries different from 800, 1600, 3000.*/
select ename,sal
from emp
where ename not like('%L%') and sal not in (800,1600,3000);

--10
/*Choose employees (name.job, salary) for those people who are supervised by somebody (MGR is not empty).*/
select ename,job,sal
from emp
where mgr is not null;

--11
/*Choose names and yearly incomes for all who work as Salesman (don't forget about commission). The column showing yearly income you should call ANNSAL.*/
select ename, 12*sal + nvl(comm,0) as ANNSAL
from emp
where job='SALESMAN';

--12
/*Show all managers from dep 10.*/
select *
from emp
where deptno=10 and job='MANAGER';

--13
/*Find people who work since 1983.*/
select *
from emp
where hiredate >= '01-JAN-83' and hiredate <'01-JAN-84';

--14
/*Choose names, yearly income and commission for all who work as "salesman" 
 and who earn salary higher than their commission.
 Show the data in order of decreasing salaries, then by names in alphabetic order.*/
select ename, 12*sal as Income, nvl(comm,0) COMM,sal
from emp
where job='SALESMAN' and sal>comm
order by sal DESC,ename;

--15
/*Show the title and data in the form of the following table: 
Who, what and when 
Smith has held the position of Clark in date 20 since 17-Dec-30
*/
select ename||' has held the position of '||job||' in dep '|| deptno||' since '||hiredate
from emp;