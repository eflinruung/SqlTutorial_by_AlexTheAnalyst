/* CTE (Common Table Expression) */

/* kumpulan hasil sementara yang ada namanya digunakan untuk memanipulasi data sub kueri kompleks.
(CTE) adalah konstruksi yang digunakan untuk menyimpan sementara kumpulan hasil dari kueri tertentu sehingga dapat dirujuk 
oleh kueri sub-urutan. 

Hasil dari CTE tidak bertahan pada disk tetapi sebaliknya, masa pakainya berlangsung hingga eksekusi kueri (atau kueri) yang 
mereferensikannya.*/

with cte_employee as		-- cte_employee = nama sub kueri cte
(select FirstName, LastName, Gender, Salary
, count (gender) over (partition by gender) as TotalGender
, avg(salary) over (partition by gender) as AvgSalary
from SQLtutorial..EmployeeDemographichs emp
join SQLtutorial..employeeSalary sal
	on emp.EmployeeID = sal.EmployeeID
where salary > '45000'
)

--select *		-- harus di eksekusi seperti ini baru bisa keluar output nya dan di run bersamaan dengan kumpulan sub kueri di atas.
--from cte_employee

/* Common Table Expressions dapat direferensikan beberapa kali dalam satu kueri yang berarti Anda tidak perlu mengulang sendiri. */

select FirstName, AvgSalary
from cte_employee


-------------------------------------------------------------------------------- tidak eror kalau di tuliskan di file baru---------
-- Beberapa CTE dapat ditentukan dalam satu kueri, masing-masing dipisahkan koma oleh yang lain.

with cte_employee1 as		-- cte_employee = nama sub kueri cte
(select FirstName, LastName, Gender, Salary
, count (gender) over (partition by gender) as TotalGender
, avg(salary) over (partition by gender) as AvgSalary
from SQLtutorial..EmployeeDemographichs emp
join SQLtutorial..employeeSalary sal
	on emp.EmployeeID = sal.EmployeeID
where salary > '45000'
), cte_employee2 as 
(select FirstName, LastName, Gender, Salary
, COUNT(gender) over (partition by gender) as TotalGender
from SQLtutorial..EmployeeDemographichs demo
join SQLtutorial..EmployeeSalary sal
	on demo.EmployeeID = sal.EmployeeID
)

select FirstName, TotalGender
from cte_employee2
