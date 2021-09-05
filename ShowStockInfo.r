#source(funcDBSelectstr)
#source(funcStockInfoToTimeSerialstr)
#stockorg=funcDBSelect(sqlConnString,sp_sqlstr_SECURITYINFO,stockno)
#stockinfo=funcStockInfoToTimeSerial(stockorg)
#stockinfo=stockinfo[dateInterval]

source(funcGetStockDatastr)
stockDS=funcGetStockData(sqlConnString,sp_sqlstr_SECURITYINFO,stockno,dateInterval)
#chartSeries(stockDS,up.col = "red",dn.col = "green",theme = "white",name = stockno)

#View(stockinfo)
