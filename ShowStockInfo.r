source(funcDBSelectstr)
source(funcStockInfoToTimeSerialstr)
stockorg=funcDBSelect(sqlConnString,sp_sqlstr_SECURITYINFO,stockno)
stockinfo=funcStockInfoToTimeSerial(stockorg)
#chartSeries(stockinfo,up.col = "red",dn.col = "green",theme = "white",name = stockno)

#View(stockinfo)
