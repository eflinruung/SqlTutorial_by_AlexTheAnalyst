/* 
string function = Trim, Ltrim, Rtrim, Replace, Substring, Upper, Lower
*/

-- DROP TABLE EmployeeErrors

create table EmployeeErrors (
EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50)
)

-- data di bawah ini merupakan data yang masih belum rapi

insert into EmployeeErrors values 
('1001 ', 'Jimbo', 'Halbert'),				-- 1001 ada spasi satu nya di depan di sebelah kanan
(' 1002', 'Pamela', 'Beasely'),				-- 1002 ada sapasi kosong di sebelah kiri
('1005', 'TOby', 'Flenderson - Fired')		-- penulisan 'TOby' yang belum baik dan ada penulisan nama 'Flenderson - Fired'

select *
from sqltutorial..EmployeeErrors

------------------------------------------------ USING TRIM, LTRIM, RTRIM ---------------------------------------------------------

-- Trim
-- membuang ruang kosong atau spasi baik yang ada di sebelah kanan maupun di sebelah kiri

select EmployeeID, Trim(EmployeeID) as IDTrim
from SQLtutorial..EmployeeErrors

-- LTrim
-- membuang ruang kosong atau spasi yang ada disebelah di sebelah kiri

select EmployeeID, Ltrim(employeeID) as ID_Ltrim
from SQLtutorial..EmployeeErrors

-- Rtrim
-- membuang ruang kosong atau spasi yang ada di sebelah kanan dan outputnya pada case ini 1002 tidak berubah karena fokus utama 
-- hanya menghapus yang di sebelah kanan sedangkan 1002 spasi atau ruang kosongnya ada di sebelah kiri.

select employeeID, RTRIM (employeeID) as ID_Rtrim
from SQLtutorial..EmployeeErrors

------------------------------------------------------------- USING REPLACE -----------------------------------------------------------

-- contoh kasus pada kolom LastName ingin meperbaiki data LastName 'Flenderson - fired' menjadi hanya 'Flenderson'
-- replace ( nama kolom, string yang ingin diganti, diganti dengan apa)

select LastName, replace(LastName, '- Fired','') as LastNameFixed
from SQLtutorial..EmployeeErrors

-------------------------------------------------------- USING SUBSTRING ------------------------------------------------------------
 /* dapat menentukan dalam angka maupun string. menentukan dimulai dari karakter apa dan berapa banyak */
select  SUBSTRING(FirstName, 1, 3) as hasil_substring
from SQLtutorial..EmployeeErrors

-- fuzzy matching
/* katakanlah di satu tabel nama saya alex dan di tabel lain nama saya alexander, jika kita mencoba menggabungkan keduanya berdasarkan
nama saya maka tidak akan bergabung karena satu adalah alex dan satunya alexander mereka tidak sama persis. tetapi jika saya mengambil
substring dan memulai posisi satu dan maju empat karakter itu akan mengambil nama alex dari keduanya dan kemudian akan mencocokkan mereka
bersama-sama dan mengatakan mereka sama. kita tahu bahwa itu tidak sempurna */

select err.FirstName, dem.FirstName
from EmployeeErrors err
join EmployeeDemographichs dem
	on err.FirstName = dem.FirstName /* tidak ada. namun pada contoh di ytb hasilnya yang sama hanya nama TOby (employeeerrors) dengan Toby 
										(employeedemographichs). pada hasilnya tersebut bahwa tidak mempedulikan tipe hurufnya baik kapital
										 atau tidak.*/

select err.FirstName, SUBSTRING(err.FirstName,1,3), dem.FirstName,SUBSTRING(dem.FirstName, 1,3)
from EmployeeErrors err
join EmployeeDemographichs dem
	on SUBSTRING(err.FirstName, 1,3) = SUBSTRING(dem.FirstName, 1,3)


/* biasanya bisa mendapatkan nilai yang sangat tinggi akurasi dalam mencocokkan orang di seluruh tabel. hal di bawah ini bisa dilakukan
ketika tidak ada id karyawan, yaitu
1. age
2. gender
3. lastname
4. dob
*/

--------------------------------------------- USING UPPER AND LOWER --------------------------------------
select firstname, LOWER(firstname)		-- lower = huruf kecil
from EmployeeErrors

select firstname, UPPER(firstname)		-- upper = huruf besar
from EmployeeErrors

-- string function di atas baru beberapa, selain di atas masih ada yang lain. dan bisa dicari sendiri.
