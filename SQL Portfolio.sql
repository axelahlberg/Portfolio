/*

Campus Data Exploration

Skills used: Joins and Aggregate Functions

*/

-- Outputs campuses and respective number of degrees issued during the year of 2004 in descending order

select campuses.campus, degrees.degrees
from campuses
inner join degrees on campuses.id=degrees.campus 
where degrees.year = '2004' 
order by degrees.degrees desc

-- Outputs the top 3 most expensive campuses and their campus fees for the year 2004

select top 3 campuses.campus, campusfee
from campuses
inner join csu_fees on campuses.id=csu_fees.campus
where csu_fees.year = '2004'
order by campusfee desc 

-- Average undergraduate to graduate ratio in US universities

select avg(undergraduate/graduate) as ugratio
from discipline_enrollments
where undergraduate > 0 and graduate > 0 

/*

Covid 19 Data Exploration 

Skills used: Joins, Aliases, Aggregate Functions, and Data Type Conversions

*/

-- The likelihood of dying if you happen to contract covid in finland

select location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as deathpercentage
from coviddeaths
where location like '%finland%'
and continent is not null 
order by 1,2

-- The percentage of the population in finland got infected with covid

select location, date, population, total_cases,  (total_cases/population)*100 as percentpopulationinfected
from coviddeaths
where location like '%finland%'
order by 1,2

-- Countries with highest infection rate in comparison to its population

select location, population, max(total_cases) as highestinfectioncount,  max((total_cases/population))*100 as percentpopulationinfected
from coviddeaths
group by location, population
order by percentpopulationinfected desc

-- Countries with highest death count per population

select location, max(cast(total_deaths as int)) as totaldeathcount
from coviddeaths
where continent is not null 
group by location
order by totaldeathcount desc

-- Contintents with the highest death count per population

select continent, max(cast(total_deaths as int)) as totaldeathcount
from coviddeaths
where continent is not null 
group by continent
order by totaldeathcount desc

-- Dataset: https://ourworldindata.org/covid-deaths

