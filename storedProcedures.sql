/*  
STORED PROUCEDURES
*/

/* sekelompok pernyataan sql yang telah dibuat kemudian di simpan dalam database itu. stored producers dapat menerima parameter
input 
 fungsi dari SQL untuk menyimpan syntax SQL dan dapat digunakan berulang kali tanpa mengubah isi dari script tersebut.*/

 -- membuat function dengan nama test (tersimpan di file programmability > stored procesures > system stored procdures

 CREATE procedure test			
 as
 select *
 from EmployeeDemographichs

 -- exec untuk mengeksekusi atau menampilkan output dari stored procesures dengan nama test
 exec test 

 ---------------------------------------------------------------------------------------------

 create procedure temp_employee  -- aneh tapi nyata garis merah tapi bisa jalan
 as
 create table #temp_employee (
 JobTitle varchar(100),
 EmployeesPerJob int,
 AvgAge int,
 AvgSalary int
 )

 insert into #temp_employee
 select JobTitle, count(JobTitle), avg(age), avg(salary)
 from EmployeeDemographichs emp
join EmployeeSalary sal
	on Emp.EmployeeID = sal.EmployeeID
group by JobTitle

/* jika saya membuat stored procesures dan kemudian menjalankannya tidak ada yang tidak ada yang benar-benar dikembalikan itu akan 
memasukkan data ke dalam temp table itu tetapi karena saya tidak memiliki pernyataan select dalam stored procesures tidak ada yang 
dikembalikan jadi mari kita tambahkan sintaks seperti di bawah ini */

select *
from #temp_employee

exec temp_employee

----------------------------- MENGUBAH STORED PROCEDURES TEMP EMPLOYEE DI DALAM FILENYA LANGSUNG (BUKAN DI SINI) -------------------------------------

/* setelah dilakukannya modifikasi terhadap file stored procesures temp_employee, maka ketika dilakukan run terhadap 
exec tem_employee		maka akan eror, karena hasil modifikasi meminta inputan parameter*/

exec temp_employee @jobtitle = 'salesman'


--------------------------------------- INI ADALAH CONTOH KETIKA MENGGUNAKAN PARAMETER LANGSUNG BUKAN DI MODIFIKASI -----------------

 create procedure temp_employee2  
 @jobtitle varchar(100)				-- ini paramemeter nya
 as
 create table #temp_employee2 (
 JobTitle varchar(100),
 EmployeesPerJob int,
 AvgAge int,
 AvgSalary int
 )

 insert into #temp_employee2
 select JobTitle, count(JobTitle), avg(age), avg(salary)
 from EmployeeDemographichs emp
join EmployeeSalary sal
	on Emp.EmployeeID = sal.EmployeeID
where JobTitle = @jobtitle					-- ini yang berhubungan dengan parameter
group by JobTitle

select *
from #temp_employee2

exec temp_employee2 @jobtitle = 'salesman'