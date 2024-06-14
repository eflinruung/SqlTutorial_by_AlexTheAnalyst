/*  Covid 19 Data Exploration   */

Select *
From PortofolioProject..CovidDeath
Where continent is not null 
order by 3,4


-- memilih data/kolom yang akan digunakan

Select Location, date, total_cases, new_cases, total_deaths, population
From PortofolioProject..CovidDeath 
Where continent is not null 
order by 1,2


-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
-- Menunjukkan kemungkinan kematian jika tertular virus corona di negara Anda

Select Location, date, total_cases,total_deaths, (CAST(total_deaths as float)/CAST(total_cases as float))*100 as DeatPercentage
From PortofolioProject..CovidDeath
Where location like '%indonesia%'
and continent is not null 
order by 1,2


-- Total Cases vs Population
-- Shows what percentage of population infected with Covid
-- Menunjukkan berapa persentase populasi yang terinfeksi Covid

Select Location, date, Population, total_cases,  (cast(total_cases as float)/population)*100 as PercentPopulationInfected
From PortofolioProject..CovidDeath
--Where location like '%indonesia%'
order by 1,2


-- Countries with Highest Infection Rate compared to Population
-- Negara dengan Tingkat Infeksi Tertinggi yang dibandingkan dengan Jumlah Penduduk

Select Location, Population, MAX(cast(total_cases as float)) as HighestInfectionCount,   max(CAST(total_cases as float)/CAST(population as float))*100 as PercentPopulationInfected
From PortofolioProject..CovidDeath
--Where location like '%indonesia%'
Group by Location, Population
order by PercentPopulationInfected desc


-- Countries with Highest Death Count per Population
-- Negara dengan Jumlah Kematian per Penduduk Tertinggi

Select Location, MAX(cast(Total_deaths as float)) as TotalDeathCount
From PortofolioProject..CovidDeath
--Where location like '%indonesia%'
Where continent is not null 
Group by Location
order by TotalDeathCount desc



-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population
-- Menampilkan benua dengan jumlah kematian tertinggi per populasi

Select continent, MAX(cast(Total_deaths as float)) as TotalDeathCount
From PortofolioProject..CovidDeath
--Where location like '%states%'
Where continent is not null 
Group by continent
order by TotalDeathCount desc



-- GLOBAL NUMBERS

Select SUM(cast(new_cases as float)) as total_cases, SUM(cast(new_deaths as float)) as total_deaths, SUM(cast(new_deaths as float))/SUM(cast(New_Cases as float))*100 as DeathPercentage
From PortofolioProject..CovidDeath
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2



-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
-- Menunjukkan Persentase Penduduk yang telah menerima setidaknya satu Vaksin Covid

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(float,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortofolioProject..CovidDeath dea
Join PortofolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3


-- Using CTE to perform Calculation on Partition By in previous query
-- Menggunakan CTE untuk melakukan Perhitungan pada Partition By pada query sebelumnya

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(float,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortofolioProject..CovidDeath dea
Join PortofolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac



-- Using Temp Table to perform Calculation on Partition By in previous query


DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortofolioProject..CovidDeath dea
Join PortofolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100
From #PercentPopulationVaccinated










-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 

