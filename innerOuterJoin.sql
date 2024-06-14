/* inner joins, full/left/right/ outer joins */


select *
from SQLtutorial.dbo.EmployeeDemographichs

select *
from SQLtutorial.dbo.EmployeeSalary

----- JOIN = MENGGABUNGKAN DATA KEARAH SAMPING


								--INNER JOIN
---------------------------------------------------------------------------------
/* KONSEP nya seperti diagram venn 'inner' = A n B	inner join akan menunjukkan semua yang umum atau tumpang tindih antara tabel A & tabel B
'left' = bagian A, 'right' = bagian B saja, 'full outer' = A u B gabungan a dan b*/

/* jika kita lihat kedua tabel memiliki 1 kolom yang sama yaitu kolom employee id yang mana merupakan kolom yang unik.
tabel employee id tersebut digunakan untuk menggabungkan tabel ini bersama-sama untuk membuat satu output*/

/* output inner join = benar-benar hanya akan menunjukkan semua yang sama jadi di kedua tabel ada id karyawan dari 1001 - 1009
jika dilihat lagi ada data yang hilang dengan sangat cepat. */

select *
from SQLtutorial.dbo.EmployeeDemographichs
inner join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID

								--FULL OUTER JOIN
-----------------------------------------------------------------------------------------------------
/* semuanya dari 1001 - 1009 sama persis, namun setelahnya pada baris ke sepuluh yaitu id 1011 menjadi sangat berbeda.
misalnya ryan howard memiliki id karyawan 1011 tetapi seperti yang kita lihat di tabel gaji tidak ada id karyawan 1011, sehingga tidak ada
yang menggabungkannya jadi karena itu isikan semuanya dengan sebagai null karena tidak ada yang cocok dengan tabel tersebut & sebaliknya
di tabel gaji ada di situ yang merupakan salesaman (baris 14) dan tidak ada id karyawan sama sekali yang artinya semua informasi ini akan
diketahui*/
------------------------------------------------------------------------------------------------------
/* dalam diagaram venn  A u B full outer join (gabungan luar penuh ) = kita akan menunjukkan semuanya dari tabel A dan tabel B terlepas dari 
apakah itu memiliki kecocokkan berdasarkan pada apa kita bergabung dengan mereka bahkan jika tabel A memiliki id karywan tetapi tidak
ada id karyawan di tabel b masih akan menunjukannya & sebaliknya*/

select *
from SQLtutorial.dbo.EmployeeDemographichs
full outer join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID

												--LEFT OUTER JOIN
---------------------------------------------------------------------------------------------------------
-- semuanya  ditampilkan dari tabel kiri dan semua yg overlaping atau tumpang tindih dan di tabel kanan atau B tidak akan di tampilkan. 
-- outputnya menunjukkan pada employee salary semuanya null karena tidak ada yang cocok dengan id di employee demograph
select *
from SQLtutorial.dbo.EmployeeDemographichs -- TABEL YANG DELUAN DITAMPILKAN (KIRI)
left outer join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
 


												-- RIGHT OUTER JOIN
 ---------------------------------------------------------------------------------------------------------
 /* SEMUA TABEL DI SEBELAH KANAN AKAN DITAMPILKAN DAN DIGABUNGKAN BERDASARKAN DENGAN NILAI ID EMPLOYEE ANATARA KE DUA TABEL */
select *
from SQLtutorial.dbo.EmployeeDemographichs -- TABEL YANG DELUAN DI TAMPILKAN (KIRI)
right outer join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID

										-- COBA HANYA MENGGUNAKAN JOIN
---------------------------------------------------------------------------------------------------------------		
/* menggabungkan tabel ke samping dengan menampilkan value yang sama antara tabel A dan tabel B */
select *
from SQLtutorial.dbo.EmployeeDemographichs
join SQLtutorial.dbo.WareHouseEmployeeDemographics
	on EmployeeDemographichs.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

select *
from SQLtutorial.dbo.EmployeeDemographichs
join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID


											--INGIN MENGGUNAKAN TABEL TERTENTU
----------------------------------------------------------------------------------------------------
/* ini akan error karena id employee terdapat di dalam 2 tabel, tentukan spesifik tabel yang mana ingin digunakan  */

select EmployeeID, FirstName, LastName, JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographichs
inner join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID

-- HASILNYA AKAN SAMA KETIKA EMPLOYEESALARY.EMPLOYEEID KARENA MENGGUNAKAN PENGGABUNGAN 'INNER JOIN' MAUPUN SEBALIKNYA
select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographichs
inner join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID

/* SEMUA YANG ADA DI TABEL KANAN ATAU B ATAU NILAI YANG SAMA PADA TABEL DI KIRI AKAN DI GUNAKAN BERDASARKAN TABEL APA SAJA 
YANG SUDAH DITENTUKAN  */
select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary --TABEL YANG INGIN DIGUNAKAN
from SQLtutorial.dbo.EmployeeDemographichs
right outer join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID

select EmployeeDemographichs.EmployeeID, FirstName, LastName, JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographichs
right outer join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID

----------------------------------------------------------------------------------------------------------------------
/* KARENA KAMI MENUNJUKKAN SEMUANYA DARI KIRI TABEL YANG MERUPAKAN TABEL DEMOGRAPHICS KARYAWAN, KAMI MASIH AKAN MELIHAT NAMA KAMI TETAPI KARENA 
KAMI MENGGUNKAN EMPLOYEID DARI TABEL KANAN KAMI SEKARANG, KAMI HANYA AKAN MENGOSONGKAN INFORMASI INI */
select EmployeeDemographichs.EmployeeID, FirstName, LastName, JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographichs
LEFT outer join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID

select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographichs
LEFT outer join SQLtutorial.dbo.EmployeeSalary
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID


												-- CONTOH STUDY KASUS
					-- MENGIDENTIFIKASI ORANG YANG MENGHASILKAN UANG PALING BANYAK SETELAH MICHAEL SCOTT
-------------------------------------------------------------------------------------------------------------------------------
select EmployeeDemographichs.EmployeeID, FirstName, LastName, Salary
from SQLtutorial.dbo.EmployeeDemographichs
inner join SQLtutorial.dbo.EmployeeSalary  -- ingin melihat data umum atau data yang ada di kedua tabel dan otomatis tidak ada yg null
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
where FirstName <> 'michael'				-- melakukan pengecualian terhada michael
order by Salary desc						-- mengurutkan Salary atau pendapatan dari yang terbesar



												-- CONTOH STUDY KASUS
							-- MENGHITUNG SERTA MENGETAHUI GAJI RATA-RATA SALESMAN
-------------------------------------------------------------------------------------------------------------------------------
select JobTitle, Salary
from SQLtutorial.dbo.EmployeeDemographichs
inner join SQLtutorial.dbo.EmployeeSalary  
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'

select JobTitle , avg(Salary)-- karena ingin melakukan group mana tabel salary yang sebelumnya di buang / di hapus
from SQLtutorial.dbo.EmployeeDemographichs
inner join SQLtutorial.dbo.EmployeeSalary  
	on EmployeeDemographichs.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
group by JobTitle