source(funcDBSelectstr)

companyclass=funcDBSelectNoParam(sqlConnString,sp_sqlstr_COMPANYCLASS)
companylist=funcDBSelect(sqlConnString,sp_sqlstr_COMPANYLIST,stockclass)

View(companylist)

