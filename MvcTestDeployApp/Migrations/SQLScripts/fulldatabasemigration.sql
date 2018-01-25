﻿--was generated by nuget console command: Update-Database -Script -SourceMigration: $InitialDatabase -TargetMigration: Employee
DECLARE @CurrentMigration [nvarchar](max)

IF object_id('[dbo].[__MigrationHistory]') IS NOT NULL
    SELECT @CurrentMigration =
        (SELECT TOP (1) 
        [Project1].[MigrationId] AS [MigrationId]
        FROM ( SELECT 
        [Extent1].[MigrationId] AS [MigrationId]
        FROM [dbo].[__MigrationHistory] AS [Extent1]
        WHERE [Extent1].[ContextKey] = N'MvcTestDeployApp.Migrations.Configuration'
        )  AS [Project1]
        ORDER BY [Project1].[MigrationId] DESC)

IF @CurrentMigration IS NULL
    SET @CurrentMigration = '0'

IF @CurrentMigration < '201712300151147_InitialMigration'
BEGIN
    CREATE TABLE [dbo].[Things] (
        [ThingId] [bigint] NOT NULL IDENTITY,
        [Name] [nvarchar](max),
        CONSTRAINT [PK_dbo.Things] PRIMARY KEY ([ThingId])
    )
    CREATE TABLE [dbo].[__MigrationHistory] (
        [MigrationId] [nvarchar](150) NOT NULL,
        [ContextKey] [nvarchar](300) NOT NULL,
        [Model] [varbinary](max) NOT NULL,
        [ProductVersion] [nvarchar](32) NOT NULL,
        CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
    )
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201712300151147_InitialMigration', N'MvcTestDeployApp.Migrations.Configuration',  0x1F8B0800000000000400CD57DB6EE336107D2FD07F10F8D4025933C916451BC8BB489DA430769D042BEFBED3D25826CA8B4A5286FD6D7DE827F5173AD4D5A2E2C49B166861C0B0C8B99C397393FFFAE3CFF8FD4E8A680BC672ADA6E462724E2250A9CEB8CAA7A474EB373F91F7EFBEFD26BECDE42EFAD2CABDF572A8A9EC946C9C2BAE28B5E90624B313C953A3AD5EBB49AA256599A697E7E73FD38B0B0A6882A0AD288A3F95CA7109D5033ECEB44AA17025130B9D81B0CD39DE2495D5E89E49B0054B614A16DB7409D6DD4021F4FEBA2826B50A89AE0567082701B12611534A3BE610ECD5670B89335AE54981074C2CF705A0DC9A090B4D1057BDF8A9F19C5FFA7868AFD89A4A4BEBB4FC4A83176F1B8268A8FE2A9A49472052788B54BBBD8FBAA2714A961B4C2E89424F573361BCD4518A2795E259145E9F757581E5E33F67D1AC14AE343055503AC3C459F458AE044F3FC07EA97F033555A51087201126DE0D0EF0E8D1E8028CDB7F82F521F47946223A54A6A176A71B2AD611CE95FBF10712DD230CB612D055C3011B89D3067E05058639C81E9973603099F30C2A3E47100287FEBBF586E55731BE60BB8FA072B7418AD98E44777C07597BD220F8AC38761F2A3953C2D0494CFB548E138C3DE41847B80D80304BFE1E76EE89BC638334A9B78DDB6164B5FD04DC2197D8703D9ABAEB264D613D85B943D7B736AD7BBB9D01F4C8108817AC28BCC35EB33989927A22CCDE245FDF25B2B64153FB44B374683B4F580C2C87E0165D23D23B6E9066E6D88AF904CE3239123B968B233CB75E077487CDD1B3DF8AFBDF4FE77ED0C0A1A59ED03B8C51627957E14207A79D1823BD6A3E33C1CCB1669B69514AF56CEB3E67A7EEA14323F5C9D8424C831042B6E888AE608084E43F57C3A148E7BDABE5A066E3A67E5EDE6EA382AA454884D46C79E68B29D95B0772E20526C9EF622638C6DB0B2C98E26B4C7E3D6809EE96CB6037FE7FF614B53613A72CABFF7055AC78CE3DBF2FEE83D132397D41A82D33E98699EF24DB7D7F68E99F2E81F17C3A61B41F9FEC75314E49B6D208BD86D86E83574EFD7167C4F4F0ED30BE01CBF3DE847F575490FA92EB8DB63273B5D62DCD18D421A25624C8C2021CCB909B6BE3F89AA50EAF53B0B68AF60B13258ADCCA156473F550BAA274D7D6825C89C1FA8FE9F3FEABD536C41C3F14FEC9FE1B21204C8E21C083FAA5E422EB70DF8DABF098095F264D69232A7C5D4173F9BEB374AFD589861AFA70F180F28DB104590834661F54C2B6F01A6CF876F2117296EEDB0177DCC8CB8918D21EDF70961B266D63A3D7F7FF78A8FFCBF3EE6FF7DDAFB8240D0000 , N'6.2.0-61023')
END

IF @CurrentMigration < '201801090256020_ThingDescription'
BEGIN
    ALTER TABLE [dbo].[Things] ADD [Description] [nvarchar](max)
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201801090256020_ThingDescription', N'MvcTestDeployApp.Migrations.Configuration',  0x1F8B0800000000000400CD57DB6E1B37107D2F907F58EC530B38A2ED14456AAC1238B21D08896C23ABE49DDA1DAD88F2B221B982F46D7DE827F51732DCFB722D5B3602B4302058E4CC993387331CEADFBFFF89DEEF040FB6A00D53721A9E4D4EC30064A25226B36958D8F5EBB7E1FB77AF7E89AE53B10BBE35766F9C1D7A4A330D37D6E61784986403829A8960895646ADED245182D05491F3D3D33FC9D919018408112B08A22F85B44C40F905BFCE944C20B705E50B950237F53AEEC4256A704B05989C26300D17DB6409C65E41CED5FE32CF27954B185C7246914E0C7C1D06544A65A945B2175F0DC4562B99C5392E50BEDCE780766BCA0DD4495C74E6C7E6737AEEF2219D63039514C62AF14CC0B337B540C4777F91CC612B204A788D52DBBDCBBA94711A2E3778B861E047BA9871EDAC0E4A3C291D4F027FFBA4AD0B2C1FF77712CC0A6E0B0D530985D5949F04F7C58AB3E413EC97EA2F90535970DE278934716FB0804BF75AE5A0EDFE0BACFBD4E7691890A133F1BD5B5FDFB1CA702EED1FBF87C12DD2A02B0E6D35F4D488ADD2F01124686A21BDA7D682C6C39CA750EA39A2E005749F4D342CBF52F105DD7D0699D90D4A4C776170C37690362B3583AF9261F7A193D5053C15E40A4CA2595ED5C94F8D1591AE6CC6C584FD6A2943696A1E7E45B87DD8D9076A0C9BB12E3353871D2658E1C760FBE786CDDDB1A93A7C5217F1439C5B76DD3542AA7BA4B96FC8810B275AD03C77013BCF7A2588ABDB67F63A7E7E478A0A8324E681C66CD9B691B0F06806DE2E8646A6374CA3CCD4D2157507384BC5C8ECD0591CD0B9893A90DB6FC44EFDC6DCFDFFF0D90F2E0B1FA913F4067314D84A65BAD0D2696EA7915F390B28A7FA5063CF142F847CF49A780CA7EAD73E48B5723CC2A019FB40838D315E443C497CF5C9487EEFF2F30FF3B19EF04DDAE86D6F783D10D5F5F8F4641E156865120628D496A5AE38E3BDB12026CE60127FE733CE30DFCE6041255B6331554322C4B978EECDF5FFCF8C25C6A4FC9841FB1F8EB915CB98D3F7C959361A84C70F37B9A53AD950FDABA0BBDFFA482F1C60CFC07BDE901ADF9F478C9EC393A72AEE6998AE1452AF2836D3EA855369DC6911E9BF9423948B651D847B374B489C7A1D686333976BD5A88D49F5193526DE612CC0D214B5B9D496AD6962713B0163CA6CBF515EA0C9B558413A977785CD0B7B690C88151F3C8522F278FC72F40E394777E5F99B9F9102D2649802DCC90F05E369CBFB665CD587205C99D4AD82ACF0398570D9BE45BA55F248A05A3E1C8C205DA32D41E41CC1CC9D8CE9165EC20D5F4F9F21A3C9BEB9300F833C7D1043D9A32B46334D85A9313A7FF7EB8FB89F7FEF7E0031876C29300E0000 , N'6.2.0-61023')
END

IF @CurrentMigration < '201801250426323_Employee_AutomaticMigration'
BEGIN
    CREATE TABLE [dbo].[Employees] (
        [EmployeeId] [bigint] NOT NULL IDENTITY,
        [FirstName] [nvarchar](max),
        [LastName] [nvarchar](max),
        [FullName] [nvarchar](max),
        [StartDate] [datetime],
        [Status] [nvarchar](max),
        [Gender] [nvarchar](max),
        [Email] [nvarchar](max),
        CONSTRAINT [PK_dbo.Employees] PRIMARY KEY ([EmployeeId])
    )
    CREATE TABLE [dbo].[MVCGridToolbarModels] (
        [MVCGridToolbarModelId] [bigint] NOT NULL IDENTITY,
        [MVCGridName] [nvarchar](max),
        [PageSize] [bit] NOT NULL,
        [ColumnVisibility] [bit] NOT NULL,
        [Export] [bit] NOT NULL,
        [GlobalSearch] [bit] NOT NULL,
        CONSTRAINT [PK_dbo.MVCGridToolbarModels] PRIMARY KEY ([MVCGridToolbarModelId])
    )
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201801250426323_Employee_AutomaticMigration', N'MvcTestDeployApp.Migrations.Configuration',  0x1F8B0800000000000400CD5ADB6EE336107D2FD07F10F4D402592BC916451BC8BBC83A1704CD0D2B27EFB434768852944A5281DD5FEB433FA9BFD0D15DA2245BB21D27C88BCCCB99E16866747890FFFEF9D7FEBAF499F10A42D2808FCD93D1B1690077038FF2C5D88CD4FCD36FE6D72F3FFE605F7AFED278CED77D8ED7E14E2EC7E68B52E1996549F7057C22473E75452083B91AB9816F112FB04E8F8F7FB74E4E2C400813B10CC3FE1E71457D487EE0CF49C05D085544D85DE00193D938CE3809AA714F7C902171616CDEBDBA5390EA024216ACCEC370946E318D734609BAE3009B9B06E13C5044A1B3674F121C2502BE70421C206CBA0A01D7CD0993901DE2AC5CDEF73CC7A7F179AC72630EE5465205FE40C093CF59802C7DFB5661368B0062082F31D46A159F3A09E3D8BCF4E3D0011E5E37763661225ED819E551BEF7C8D0571C15D9814914FF1D199388A948C09843A4046147C6633463D4FD0356D3E04FE0631E315675159DC5B9DA000E3D8A2004A156DF61AE1DE0C6330DABBEDFD2018AED2D7BD3A3DE70F5EB2FA6718FCE90198322332A61715420E01A3808A2C07B244A81C0177BE34112DB86179ACD2B2AA48A1F7393988F585FA6714796B7C017EA05034E96A6714597E0E523991B4F9C6239E2262522D864E9961CC8D01546EB20861C4584BAC0B0E796E2E729F5FB6C54917C73FF302B3C106F6EE6D22794EDD98A6D95AD616DC3B87B9E5C0BEA4D8380CD88483AC136BDA305E65DDB488B3FDB74940E98433597CCFC418AF1912CC0A17F1786BEE19981F096F3ADC799042CF2F9339574465972C6DDF02E976120D4AE28D72C9811E60011EECB30ACDE95347D495ECCF0DA4936BE6BB5241E6C531FC5C64355C4414AE102A42B689852B403B665A4CA8A500C4D5EFE5A46C4F3B0542D39863C384B339999AD1F30C57740694C09BFA1A54329BF1E9514D25A0FD2D21CDBF05ABF301BA093BC6A03CB8AAC2DA645F4CA1B86955E31F2AB88D57117B1EF4818C606CB9DD988E1A41793C927673859F7530CCB952D9CBDF0B6B08485812D589B8DFBA90709C944724466244EB089E7379675E54A479C73AB7A3AE8BDA27C01F98EF8B93D3DF57B840E5686F50A4FEA63C1278786C2A9CAF5A5B135B92F1246C41ACE9F7E7A36DD23D6A155D87C15AC32DC1FABE4EB55A8727480570521AF39558CF647AA30EE2A546578105642C235A064AC3F4ACEB1AB28F9587F948C42D71320196A62D89696857ACE5B8DA4D7BE8A7A15F5AAB1D66EB98F726BEBAFC32BAF174A57F83B6872F575F422E43D6C34EBA036D11FAFE4BB55B072B43F5293F156119BB303D23AE3BEB5BCCEC60694588DFBD60AAD36F3614A25FBFAEFA33852BE30BC1C3AF67585B8E0C1D5E876B0EA7538CDEC1E9AD635EE5A05AA4D1CF85537289ABEA4B05E50358D92D9193DDAAC2137F852BAC4343050AFD48BB992B3920AFC51BC60E4FCC5268CE279CB057784D33926537AA7324F8F4F4E3505FAE3A8C196941EEB2909BFBB1A3BA30B1A077AE31D70E0E5BEA1C1F2D7B8A311F1934F963F57E1B6D1597702D3B5D49DC01A7AA987CF2AD14B070355F4D39D7CAA6BA43B41D574D001483B699D1F545B7CAB52695114777A67BA6A38A36A6F8AE1365875B5701B8436A57033CE4095F01D35BAB7CAACBDA5548BFAB6B766A02B6C4D71A59F6EB656364B090776E7598007481DAD086EC355B5BEA25A9BE17691AE8FFCD6ADBEB5D9C915BB2D95B926BDB3ADEA3F12D89815745142C4FF56C0C18D93A404CDD7DCF0799027151EAAEA51BE446F8BA0087E4CC9B950744E5C85D32E48999CF699B028798333F06EF843A4C2489D4B09FE8CD52E73B6B5DE7E223FD67DB61F923497FB3802BA49633EF0C0BF45947985DF572DCDAA0322AE86AC23A0578E8A3BC3625520DD07BC2750163EBC8DC5EC80AB2960FA23987CE00E79856D7C7B92700B0BE2AE7296DE0DB2F945D4C36E5F50B210C4971946B91F7F620E7BFEF2CBFF0A296C104F230000 , N'6.2.0-61023')
END

IF @CurrentMigration < '201801250426324_Employee'
BEGIN
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201801250426324_Employee', N'MvcTestDeployApp.Migrations.Configuration',  0x1F8B0800000000000400CD5ADB6EE336107D2FD07F10F4D402592BC916451BC8BBC83A1704CD0D2B27EFB434768852944A5281DD5FEB433FA9BFD0D15DA2245BB21D27C88BCCCB99E16866747890FFFEF9D7FEBAF499F10A42D2808FCD93D1B1690077038FF2C5D88CD4FCD36FE6D72F3FFE605F7AFED278CED77D8ED7E14E2EC7E68B52E1996549F7057C22473E75452083B91AB9816F112FB04E8F8F7FB74E4E2C400813B10CC3FE1E71457D487EE0CF49C05D085544D85DE00193D938CE3809AA714F7C902171616CDEBDBA5390EA024216ACCEC370946E318D734609BAE3009B9B06E13C5044A1B3674F121C2502BE70421C206CBA0A01D7CD0993901DE2AC5CDEF73CC7A7F179AC72630EE5465205FE40C093CF59802C7DFB5661368B0062082F31D46A159F3A09E3D8BCF4E3D0011E5E37763661225ED819E551BEF7C8D0571C15D9814914FF1D199388A948C09843A4046147C6633463D4FD0356D3E04FE0631E315675159DC5B9DA000E3D8A2004A156DF61AE1DE0C6330DABBEDFD2018AED2D7BD3A3DE70F5EB2FA6718FCE90198322332A61715420E01A3808A2C07B244A81C0177BE34112DB86179ACD2B2AA48A1F7393988F585FA6714796B7C017EA05034E96A6714597E0E523991B4F9C6239E2262522D864E9961CC8D01546EB20861C4584BAC0B0E796E2E729F5FB6C54917C73FF302B3C106F6EE6D22794EDD98A6D95AD616DC3B87B9E5C0BEA4D8380CD88483AC136BDA305E65DDB488B3FDB74940E98433597CCFC418AF1912CC0A17F1786BEE19981F096F3ADC799042CF2F9339574465972C6DDF02E976120D4AE28D72C9811E60011EECB30ACDE95347D495ECCF0DA4936BE6BB5241E6C531FC5C64355C4414AE102A42B689852B403B665A4CA8A500C4D5EFE5A46C4F3B0542D39863C384B339999AD1F30C57740694C09BFA1A54329BF1E9514D25A0FD2D21CDBF05ABF301BA093BC6A03CB8AAC2DA645F4CA1B86955E31F2AB88D57117B1EF4818C606CB9DD988E1A41793C927673859F7530CCB952D9CBDF0B6B08485812D589B8DFBA90709C944724466244EB089E7379675E54A479C73AB7A3AE8BDA27C01F98EF8B93D3DF57B840E5686F50A4FEA63C1278786C2A9CAF5A5B135B92F1246C41ACE9F7E7A36DD23D6A155D87C15AC32DC1FABE4EB55A8727480570521AF39558CF647AA30EE2A546578105642C235A064AC3F4ACEB1AB28F9587F948C42D71320196A62D89696857ACE5B8DA4D7BE8A7A15F5AAB1D66EB98F726BEBAFC32BAF174A57F83B6872F575F422E43D6C34EBA036D11FAFE4BB55B072B43F5293F156119BB303D23AE3BEB5BCCEC60694588DFBD60AAD36F3614A25FBFAEFA33852BE30BC1C3AF67585B8E0C1D5E876B0EA7538CDEC1E9AD635EE5A05AA4D1CF85537289ABEA4B05E50358D92D9193DDAAC2137F852BAC4343050AFD48BB992B3920AFC51BC60E4FCC5268CE279CB057784D33926537AA7324F8F4F4E3505FAE3A8C196941EEB2909BFBB1A3BA30B1A077AE31D70E0E5BEA1C1F2D7B8A311F1934F963F57E1B6D1597702D3B5D49DC01A7AA987CF2AD14B070355F4D39D7CAA6BA43B41D574D001483B699D1F545B7CAB52695114777A67BA6A38A36A6F8AE1365875B5701B8436A57033CE4095F01D35BAB7CAACBDA5548BFAB6B766A02B6C4D71A59F6EB656364B090776E7598007481DAD086EC355B5BEA25A9BE17691AE8FFCD6ADBEB5D9C915BB2D95B926BDB3ADEA3F12D89815745142C4FF56C0C18D93A404CDD7DCF0799027151EAAEA51BE446F8BA0087E4CC9B950744E5C85D32E48999CF699B028798333F06EF843A4C2489D4B09FE8CD52E73B6B5DE7E223FD67DB61F923497FB3802BA49633EF0C0BF45947985DF572DCDAA0322AE86AC23A0578E8A3BC3625520DD07BC2750163EBC8DC5EC80AB2960FA23987CE00E79856D7C7B92700B0BE2AE7296DE0DB2F945D4C36E5F50B210C4971946B91F7F620E7BFEF2CBFF0A296C104F230000 , N'6.2.0-61023')
END
