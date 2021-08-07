source(funcDBSelectstr)
source(funcStockInfoToTimeSerialstr)
stockorg=funcDBSelect(sqlConnString,sp_sqlstr,stockno)
stockinfo=funcStockInfoToTimeSerial(stockorg)
chartSeries(stockinfo[dateInterval],up.col = "red",dn.col = "green",theme = "white",name = stockno)

