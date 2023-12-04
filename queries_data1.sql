!--1.	Select all columns from the 'employees' table.
select * from employees


!--2.	Select only the 'first_name' and 'last_name' columns from the 'employees' table.
select employees.first_name, employees.last_name from employees


!--3.	Select unique department names from the 'departments' table.
select distinct department_name from departments


!--4.	Filter employees who were hired after '2020-01-01' from the 'employees' table.
select * from employees where hire_date > '2020-01-01'


!--5.	Calculate the average salary of all employees.
select avg(salary) from employees


!--6.	Count the number of employees in each department.
select count(department_id) as emp_number, department_name  from departments group by department_name


!--7.	Select employees whose first names start with 'J'.
select * from employees where first_name like 'J%'


!--8.	Update the salary of employee with id 1 to 70000.
update employees set salary = 70000 where employee_id = 1


!--9.	Insert a new department named 'Legal' with id 10.

insert into departments (department_id, department_name)  values (10,'Legal')

!--10.	Delete the recent added "Legal" department on departments table
delete from departments where department_name = 'Legal'


!--11.	Select employees along with their department names.
select employees.first_name as first_name, employees.last_name as last_name, departments.department_name as department_name
from employees left join departments on employees.department_id = departments.department_id


!--12.	Select the top 5 highest-paid employees.
select top 5 *  from employees order by salary desc


!--13.	Select employees hired in the year 2019 and sort them by hire date.
select * from employees


!--14.	Calculate the total salary expenditure for each department.
select departments.department_name as dpt_name, 
sum(employees.salary) as total_salary from employees left join departments on  
employees.department_id = departments.department_id group by department_name


!--15.	Find employees who have worked on multiple projects.
select  employees.employee_id, employees.first_name, employees.last_name ,count(employee_projects.project_id) as projects
from employees 
left join 
employee_projects on employees.employee_id = employee_projects.employee_id  group by employees.employee_id, employees.first_name, employees.last_name


!--16.	Find the average salary for each department, only including departments with more than 2 employees.
with myquery as (
select employees.department_id,  departments.department_name, avg(employees.salary) as avg_salary,count(employees.department_id) as employees_number
from employees 
left join departments on employees.department_id = departments.department_id
group by employees.department_id, department_name
)
select * from myquery where myquery.employees_number > 1


!--17.	Update the project end date for Project D to '2022-12-31'.
update projects set end_date = '2022-12-31' where projects.project_name = 'Project D'

!--18.	Insert a new project named 'Project E' with id 5 and start date '2023-01-01'.
insert into projects (project_id, project_name, start_date) 
values 
(5, 'Project E', '2023-01-01')


!--19.	Select distinct project names from the 'employee_projects' table.
select  distinct project_name from employee_projects left join projects on employee_projects.project_id = projects.project_id


!--20.	Find the employee with the highest salary.
select top 1 first_name, last_name, salary from employees order by salary desc


!--21.	Count the number of employees born in each year.
select year(birth_date) as year, count(*) as employees_born from employees 
group by 
year(birth_date)


!--22.	Select employees who were hired before '2018-01-01' or after '2021-01-01'.
select * from employees where hire_date < '2018-01-01' or hire_date > '2021-01-01'


!--23.	Calculate the total number of projects.
select count(*) as projects_number from projects


!--24.	Select employees whose last names end with 'son'.
select * from employees where last_name like '%son'

!--25.	Find the average salary of employees in the 'IT' department.
select department_name, avg(salary) as avg_salary from employees 
left join departments on employees.department_id = departments.department_id
where department_name = 'IT'
group by department_name


!--26.	Count the number of projects each employee is assigned to
select employees.employee_id, employees.first_name, employees.last_name,  count(projects.project_id) as project_number from employees 
left join employee_projects on employees.employee_id = employee_projects.employee_id
left join projects on employee_projects.project_id = projects.project_id
group by employees.employee_id, employees.first_name, employees.last_name

!--27.	Select employees and their projects, but only include those in the 'HR' department.
select employees.first_name, employees.last_name, projects.project_name, departments.department_name
from employees 
left join employee_projects on employees.employee_id = employee_projects.employee_id
left join projects on employee_projects.project_id = projects.project_id
left join departments on employees.department_id = departments.department_id
where departments.department_name = 'HR'


!--28.	Calculate the total salary of all employees.
select sum(salary) as total_salary_all_employees from employees

!--29.	Select employees with a salary greater than 80000.
select * from employees  where salary > 80000

!--30.	Find the oldest employee.
select top 1 * from employees where birth_date is not null order by birth_date asc


!--31.	Count the number of employees in each department and order the result by the department name.
select departments.department_name, count(employees.employee_id) as employees_number from employees 
left join departments on employees.department_id = departments.department_id
group by departments.department_name
order by departments.department_name 

!--32.	Select employees who have not been assigned to any project.
select * from employees
left join employee_projects on employees.employee_id = employee_projects.employee_id
where employee_projects.project_id is null


!--33.	Calculate the average salary for employees hired in the year 2020.
select avg(salary) avg_salary from employees where year(hire_date) = '2020'

!--34.	Find the project with the earliest start date.
select top 1 * from projects order by start_date

!--35.	Select employees who have worked on 'Project B'.
select * from employees
left join employee_projects on employees.employee_id = employee_projects.employee_id
left join projects on employee_projects.project_id = projects.project_id
where projects.project_name = 'Project B'

!--36.	Find the department with the most employees.
select top 1 department_name, count(department_name) employees_number  from employees
left join departments on employees.department_id = departments.department_id
group by department_name
order by employees_number desc


!--37.	Select employees who were hired on the same day as 'John Doe'.
select * from employees where hire_date = 
(select hire_date from employees where first_name = 'John' and last_name = 'Doe')


!--38.	Calculate the total number of employees.
select count(employee_id) as number_of_employees  from employees


!--39.	Select employees who have a salary between 60000 and 80000.
select * from employees where salary between 60000 and 80000
select * from employees where salary >= 60000 and salary <= 80000


!--40.	Find the average age of employees. (Assume the current date is 2023-01-01)
select avg(DATEDIFF(year,employees.birth_date,  '2023-01-01')) as avg_years from employees


!--41.	Select employees who were not hired in the year 2017.
select * from employees where year(employees.hire_date) <> 2017


!--42.	Count the number of distinct department names in the 'departments' table.
select distinct department_name from departments


!--43.	Select employees who have a null value for the 'birth_date' column.
select * from employees where birth_date is null


!--44.	Find the employee with the highest salary in the 'IT' department.
select top 1 first_name, last_name, salary from employees	
left join departments on employees.department_id = departments.department_id
where department_name = 'IT'

!--45.	Select employees and their projects, showing even those without projects, but only include 'Engineering' department employees.
select first_name, last_name, department_name, project_name from employees
left join employee_projects on employees.employee_id = employee_projects.employee_id
left join projects on employee_projects.project_id = projects.project_id
left join departments on employees.department_id = departments.department_id
where department_name = 'Engineering'


!--46.	Count the number of projects started after '2022-01-01'.
select * from projects where start_date > '2022-01-01'


!--47.	Select employees who have a salary greater than the average salary.
select * from employees where salary > (select avg(salary) from employees)


!--48.	Find the project with the longest duration.
select top 1 DATEDIFF(day, start_date, end_date) as duration_days, project_name from projects
order by duration_days desc


!--49. Delete all employees who were hired before '2015-03-01'.
select * from employees where hire_date < '2015-03-01'


!--50.Calculate the total duration (in days) for each project and order the result by the total duration in descending order.
select DATEDIFF(day, start_date, end_date) as duration_days, project_name  from projects order by duration_days desc
