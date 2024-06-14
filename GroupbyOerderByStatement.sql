/* 
group by, order by
*/




/* penggunaan order by mengurutkan data berdasarkan tabel yang dipanggil (order by = dipesan oleh). 
kolom yang dipanggil akan menampilkan kumpulan data yang terorder atau tersusun baik dari
yang terkecil maupun dari terbesar dan atau dari huruf awal hingga akhir maupun sebaliknya. */
select *
from EmployeeDemographichs
order by Age

/* bisa dibandingkan di atas untuk melihat kejelasan. dua kolom di bawah di urutkan dari yang terbesar. pada kolom
gender sadar bahwa di umur 30 berdasarkan gender diurutkan dari huruf M (Male) terlebih dahulu kemudian huruf F (Female) */
select *
from EmployeeDemographichs
order by Age desc, Gender desc

select *
from EmployeeDemographichs
order by age, Gender desc /* hanya kolom gender yang dimulai dari huruf yang awal  yaitu Male (M) kemudian Female (F) berdasarkan
kolom age (contohnya pada umur 30 ada 3 orang). */

/* alih-alih menggunakan nama kolom order by juga bisa menggunakan angka (urutan ke berapa tabel tersebut) untuk mengakses tabel */
select *
from EmployeeDemographichs
order by 4 desc, 5 desc





/* hanya melihat apa saja data yang unik tanpa menggrupkan data tersebut */
select Distinct (Gender)
from EmployeeDemographichs

/* tampilannya sama dengan kalau pakai distinc tapi sebenarnya dia menggroup kumpulan data yang ada */
select gender
from EmployeeDemographichs
group by Gender

/*  ketika menggunakan group by maka yang bagian select nya harus nama kolom yang pertama di tuliskan*/
select Gender,count(firstname)
from EmployeeDemographichs
group by Gender


/* menggunakan count untuk menghitung berapa banyak kumpulan data yang berada dalam satu grup */
select Gender,count(Gender)
from EmployeeDemographichs
group by Gender

/*  */
select *
from EmployeeDemographichs

select gender, age,  count (gender)
from EmployeeDemographichs
group by gender, Age


/* as digunakan untuk memberikan nama pada kolom, pada kasus ini order by digunakan hanya untuk memanggil kolom berdasarkan kolom yang di select, 
di luar select akan terjadi error. kolom yang dipanggil akan menampilkan kumpulan data yang terorder atau tersusun baik dari
yang terkecil maupun dari terbesar dan atau dari huruf awal hingga akhir maupun sebaliknya */


select Gender, count(Gender) as CountGender
from EmployeeDemographichs
where age > 31
group by Gender
order by CountGender

/*  */
select gender, count(gender) as CountGender
from EmployeeDemographichs
where age > 31
group by Gender
order by CountGender ASC	  /*secara default sql menggunakan asc yaitu nilai dari yang terkecil ke terbesar begitu pun juga untuk huruf */

select gender, count(gender) as CountGender
from EmployeeDemographichs
where age > 31
group by Gender
order by gender desc /* kebalikan dari asc */


