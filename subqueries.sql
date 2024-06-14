/* subqueries (in the select, from, and where statement) 

yang di dalam kurung itu subqueri.
Konsep dasar SQL subquery adalah adanya query di dalam query utama. Subquery atau kadang disebut juga dengan nested queries 
atau inner queries merupakan query yang terletak di dalam query utama (main query/outer query). Query utama bersifat dependen 
dengan query di dalamnya. Artinya, hasil yang dikeluarkan dari query utama bergantung dengan hasil yang diperoleh dari subquery. 
Sedangkan subquery dapat bersifat independen (kecuali correlated subquery) yang artinya dapat dijalankan dengan sendirinya.*/

select *
from EmployeeSalary

------------------------------------------------------- SUBQUERIES IN SELECT -------------------------------------------------------

select EmployeeID, Salary, (select AVG(salary) from EmployeeSalary) as AllAvgSalary
from EmployeeSalary

-- dicoba menggunakan join ternyata bisa.
-- jumlah (select AVG(salary) from EmployeeSalary) sebanyak berdasarkan join nya

select sal.EmployeeID, Salary, (select AVG(salary) from EmployeeSalary) as AllAvgSalary
from EmployeeSalary sal
join EmployeeDemographichs dem
	on sal.EmployeeID =dem.EmployeeID

--------------------------------------------------------- HOW TO DO IT WITH PARTITION BY -------------------------------------------------------
/* hasilnya sma dengan contoh di atas SUBQUERIES IN SELECT  */
select EmployeeID, Salary, AVG(salary) over () allAvgSalary
from EmployeeSalary
-- coba2
select EmployeeID, Salary, AVG(salary) over (partition by salary) allAvgSalary
from EmployeeSalary

--------------------------------------------------------- WHY GROUP BY DOESN'T WORK -------------------------------------------------------
-- karena kita tidak mendapatkan avg yang sesuai dengan yang di inginkan seperti pada partition by.
select EmployeeID, salary, avg(salary) as AllAvgSalary
from EmployeeSalary
group by EmployeeID, Salary
order by 1,2


--------------------------------------------------------- SUBQUERIE IN FROM -------------------------------------------------------
select a.employeeid, AllAvgSalary
from (select employeeid, salary, avg(salary) over () as AllAvgSalary
		from EmployeeSalary) a

------------------------------------------------------- SUBQUERY IN WHERE -------------------------------------------------------
-- ketika menggunakan subqueri
-- situasinya ingin menampilkan tabel employeeid, jobtitle dan salary dengan ada 2 kondisi dimana tabel employeeid dari employeesalary
-- ada di dalam employeeid nya EmployeeDemographichs dan dimana value umur lebih besar dari 30
select employeeid, jobtitle, salary
from employeeSalary
where employeeid in (
	select EmployeeID 
	from EmployeeDemographichs
	where age > 30)

-- hasilnya sama dengan yang di atas (ketika tidak menggunakan subqueri). 
select sal.employeeid, jobtitle, salary
from EmployeeSalary sal
join EmployeeDemographichs dem
	on sal.EmployeeID = dem.EmployeeID
where age >30

------------------------------------------------- di coba2 sendiri
/* tampilkan kolom employeeid dan kolom firstname dari tabel employeeerrors berdasarkan kondisi bahwa employee id nya sama dengan 1002 tapi 
ada dalam tabel employeedemograpichs*/

select employeeid, FirstName
from EmployeeErrors
where EmployeeID = (select EmployeeID from EmployeeDemographichs where EmployeeID = '1002')
