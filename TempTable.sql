/* Temp Tables */

/* tabel sementara / temp tabel sama seperti ketika membuat table biasa
Ini dirancang untuk menyimpan data sementara yang diperlukan untuk waktu yang singkat dan tidak memerlukan solusi penyimpanan permanen.
Tabel sementara dibuat dengan cepat dan biasanya digunakan untuk melakukan perhitungan yang kompleks, menyimpan hasil antara, 
atau memanipulasi subkumpulan data selama eksekusi kueri atau serangkaian kueri.*/

create table #temp_employee ( --yang membedakan dari pembuatan tble biasa adalah tand pagar #
EmployeeID int,
JobTitle varchar(100),
Salary int
)

select *
from #temp_employee

insert into #temp_employee values (
'1001', 'HR', '45000'
)

/* mengambil data dari dalam tabel lain sehigga leih menghemat waktu. (bisa digunakan untuk memanipulasi data dalam tabel sementara 
(temp table)). */

insert into #temp_employee
select *
from SQLtutorial..EmployeeSalary

--delete from #temp_employee
--where EmployeeID = 1001

---------------------------------------------------------------------------------------------
/* ketika di coba di run sekaligus akan eror makanya di perlukan sintaks 'drop'. */

drop table if exists #temp_employee2
create table #temp_employee2 (
JobTitle varchar(50),
EmployeePerJob int,
AvgAge int,
AvgSalary int
)

/* cara ini akan mempermudah untuk dalam menghemat waktu */

insert into #temp_employee2 
select JobTitle, Count(JobTitle), Avg(age), avg(salary)
from SQLtutorial..EmployeeDemographichs emp
join SQLtutorial..EmployeeSalary sal
	on emp.EmployeeID = sal.EmployeeID
group by JobTitle

select *
from #temp_employee2

