--ALTER TABLE [dbo].[Student Mental health] --
--DROP COLUMN [Timestamp];--

--Converts all of the entries in the 'Your_current_year_of_Study' column to lowercase--
UPDATE [dbo].[Student Mental health]
SET [Your_current_year_of_Study] = LOWER([Your_current_year_of_Study])

--Calculates the average of the CGPA range for each record
--This wil make it easier to perform statistical analysis on the CGPA in Power BI.
UPDATE [dbo].[Student Mental health]
SET [What_is_your_CGPA] = 
    (CAST(SUBSTRING([What_is_your_CGPA], 1, CHARINDEX('-',[What_is_your_CGPA] ) - 1) AS FLOAT) + 
     CAST(SUBSTRING([What_is_your_CGPA], CHARINDEX('-',[What_is_your_CGPA] ) + 1, LEN([What_is_your_CGPA])) AS FLOAT)) / 2
WHERE CHARINDEX('-', [What_is_your_CGPA]) > 0;


--Finds all the students that share the highest GPA
--SELECT *
--FROM [dbo].[Student Mental health]
--WHERE [What_is_your_CGPA] = (SELECT MAX([What_is_your_CGPA]) FROM [dbo].[Student Mental health]);

--Finds all depressed students that went to recieve specialist help
--SELECT *
--FROM [dbo].[Student Mental health]
--WHERE Do_you_have_depression = 1 AND Did_you_seek_any_specialist_treatment = 1;

--Finds all of the derpessed students who did not recieve 
--SELECT *
--FROM [dbo].[Student Mental health]
--WHERE Do_you_have_depression = 1 AND Did_you_seek_any_specialist_treatment = 0;


--Shows the entire table.
SELECT *
FROM [dbo].[Student Mental health]

--States the name of the SQL Server
--SELECT @@SERVERNAME AS 'Server Name';

