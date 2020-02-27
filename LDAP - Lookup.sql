DECLARE @group NVARCHAR(128) = 'AD Security Group'
DECLARE @DC1 NVARCHAR(128) = 'Your Domain - so google'
DECLARE @DC2 NVARCHAR(128) = 'Your top level domain - so com'

DECLARE @SQL NVARCHAR(MAX)
DECLARE @group_dn NVARCHAR(512)
DECLARE @result TABLE(name NVARCHAR(512))

--Get the actual group name
SET @SQL = 
'SELECT distinguishedName
FROM OPENQUERY
(ADSI,''SELECT cn, distinguishedName, dc
FROM ''''LDAP://' + @DC1 + '.' + @DC2 + '/DC=' + @DC1 + ',DC=' + @DC2 + '''''
WHERE objectCategory = ''''group'''' AND cn = ''''' + @group + ''''''')'

--PRINT @SQL
INSERT @result(name)
EXEC sp_executesql @SQL
SELECT @group_dn = name FROM @result


--https://ldapwiki.com/wiki/1.2.840.113556.1.4.1941
SET @SQL =
'SELECT *
FROM OPENQUERY (ADSI, ''<LDAP://' + @DC1 + '.' + @DC2 + '>;
(&(objectCategory=person)(memberOf:1.2.840.113556.1.4.1941:=' + @group_dn + '));
cn, sAMAccountName,mail;subtree'')
ORDER BY cn;'

--PRINT @SQL
EXEC sp_executesql @SQL