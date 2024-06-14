/****** script for selectTopRows command from SSMS ******/
SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
  FROM [SQLtutorial].[dbo].[EmployeeDemographichs]
