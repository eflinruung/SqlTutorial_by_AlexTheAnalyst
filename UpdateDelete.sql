/* updating/deleting data */

select *
from SQLtutorial.dbo.EmployeeDemographichs

update SQLtutorial.dbo.EmployeeDemographichs
set EmployeeID = 1012								-- menentukan tabel mana yang akan di isi/ diu update
where FirstName = 'Holly' and LastName = 'Flax'		-- menentukan secara spesifik baris mana yang ingin di update

update SQLtutorial.dbo.EmployeeDemographichs
set Age = 31 , Gender = ' Female'					-- gunakan tanda koma (,)
where FirstName = 'Holly' and LastName = 'Flax'		-- selain cara di samping bisa juga dengan hanya menggunakan 1 tabel yaitu employeeID
													-- karena employeeID unik, jadi dapat digunakan untuk menyatakan baris mana yg ingin di update
													-- contoh : EmployeeID = 1012

-------------------DELETE----------------------

delete from SQLtutorial.dbo.EmployeeDemographichs
where EmployeeID = 1005

/* harus berhati-hati ketika menggunakan delete karna datanya tidak akan bisa balik lagi.
jadi ada sedikit trik sebelum meng run delete statement yaitu dengan melihat datanya terlebih dahulu*/

select *										-- memilih semua kolom
from SQLtutorial.dbo.EmployeeDemographichs
where EmployeeID = 1004							-- pas di coba EmployeeID = 1004, 1002 jadinya eror



