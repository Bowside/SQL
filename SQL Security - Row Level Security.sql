--*******************
--Row Level Security
--*******************
--Show no security
SELECT *
FROM [DataWarehouse].[DimCountry_SecurityDemo]

SELECT *
FROM DataWarehouse.FactAnnualBudget

SELECT  *
FROM DataWarehouse.FactVaR
WHERE COBDateId = 20170201

--Apply Security
CREATE FUNCTION dbo.LimitCountryAccess(@CountryId Int)
RETURNS TABLE
WITH SCHEMABINDING
AS
  RETURN 
  (
    SELECT [Go] = 1 FROM [DataWarehouse].[DimCountry_SecurityDemo]
      WHERE 
      (
	    [DimCountryId] = @CountryId
        AND IS_MEMBER([Security]) = 1
	) --OR IS_SRVROLEMEMBER(N'sysadmin') = 1
  );
GO

CREATE SECURITY POLICY CountryPolicy
ADD FILTER PREDICATE dbo.LimitCountryAccess([DimCountryId]) ON [DataWarehouse].[DimCountry_SecurityDemo]
,ADD FILTER PREDICATE dbo.LimitCountryAccess([CountryId]) ON [DataWarehouse].[FactAnnualBudget]
,ADD FILTER PREDICATE dbo.LimitCountryAccess([CountryId]) ON [DataWarehouse].[FactVaR]
WITH (STATE = ON);

--Show that security is applied
SELECT *
FROM [DataWarehouse].[DimCountry_SecurityDemo]

SELECT *
FROM DataWarehouse.FactAnnualBudget

SELECT  *
FROM DataWarehouse.FactVaR
WHERE COBDateId = 20170201

--Cleanup
DROP SECURITY POLICY [SCMBNT1\CIBR_CR_Report Group].[CountryPolicy]
DROP FUNCTION dbo.LimitCountryAccess

--************
--Data Masking
--************
--Add Mask
ALTER TABLE [DataWarehouse].[DimCountry_SecurityDemo]
ALTER COLUMN Country ADD MASKED WITH (FUNCTION = 'default()');

--I'm dbo so I can see
SELECT *
FROM [DataWarehouse].[DimCountry_SecurityDemo]

CREATE USER Test WITHOUT LOGIN;
GRANT SELECT ON [DataWarehouse].[DimCountry_SecurityDemo] TO Test;
EXECUTE AS USER = 'Test';
SELECT * FROM [DataWarehouse].[DimCountry_SecurityDemo];
REVERT

GRANT UNMASK TO Test;
EXECUTE AS USER = 'Test';
SELECT * FROM [DataWarehouse].[DimCountry_SecurityDemo];
REVERT


3_~