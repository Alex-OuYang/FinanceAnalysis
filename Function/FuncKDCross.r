library(quantmod)
source(funcGetStockDatastr)
stockDS=funcGetStockData(sqlConnString,sp_sqlstr_SECURITYINFO,stockno,dateInterval)

