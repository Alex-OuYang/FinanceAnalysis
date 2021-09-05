funcGetStockData=function(sqlConnString,sp_sqlstr_SECURITYINFO,stockno,dateInterval){
  source(funcDBSelectstr)
  source(funcStockInfoToTimeSerialstr)
  stockorg=funcDBSelect(sqlConnString,sp_sqlstr_SECURITYINFO,stockno)
  stockinfo=funcStockInfoToTimeSerial(stockorg)
  stockinfo=stockinfo[dateInterval]
  
  return(stockinfo)
}