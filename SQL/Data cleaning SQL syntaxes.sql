/*

Data cleaning query syntaxes

*/

-- Date standardization

Select column1, CONVERT(Date,column1)
From table1

Update table1
SET column1 = CONVERT(Date,column)

-- If it doesn't update properly

ALTER TABLE table1
Add new_column Date;

Update table1
SET new_column = CONVERT(Date,column1)

-- Populate null values

Update a
SET column1 = ISNULL(a.column1,b.column1)
From table1 a
JOIN table1 b
	on a.notuniqueid = b.notuniqueid
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.column1 is null

-- Breaking up column that seperates values with ',' as delimiter with substring

ALTER TABLE table1
Add new_column Nvarchar(255);

Update table1
SET new_column = SUBSTRING(column1, 1, CHARINDEX(',', column1) -1 )

ALTER TABLE table1
Add new_column2 Nvarchar(255);

Update table1
SET new_column2 = SUBSTRING(column1, CHARINDEX(',', column1) + 1 , LEN(column1))

-- Breaking up column with parsename (+ replacing ',' delimiter)

ALTER TABLE table1
Add new_column Nvarchar(255);

Update table1
SET new_column = PARSENAME(REPLACE(column1, ',', '.') , 3)

ALTER TABLE table1
Add new_column2 Nvarchar(255);

Update NashvilleHousing
SET new_column2 = PARSENAME(REPLACE(column1, ',', '.') , 2)

ALTER TABLE table1
Add new_column3 Nvarchar(255);

Update table1
SET new_column3 = PARSENAME(REPLACE(column1, ',', '.') , 1)

-- Change values in column with case statement (Y to Yes, N to No)

Update table1
SET column1 = CASE When column1 = 'Y' THEN 'Yes'
	   When column1 = 'N' THEN 'No'
	   ELSE column1
	   END

-- Delete columns

ALTER TABLE table1
DROP COLUMN column1, column2, column3

