# https://ithelp.ithome.com.tw/articles/10185908
# https://sqlserverrider.wordpress.com/2015/09/25/connect-to-sql-server-in-r-without-odbc-dns-connection/

if(!("RODBC" %in% rownames(installed.packages()))){
  install.packages("RODBC")
}
require(RODBC)

funcDBSelect=function(sqlConnString,sp_sqlstr,param){
  
  # 使用 odbc driver 連接 SQL SERVER
  sqlconnection=odbcDriverConnect(sqlConnString)
  
  # 組 查詢語法
  sqlstr=paste0(sp_sqlstr,param)
  
  # 查詢結果
  queryResult=sqlQuery(sqlconnection,sqlstr)
  
  # 關閉 DB 連線
  odbcClose(sqlconnection)
  
  # 回傳 DB 查詢結果
  return(queryResult)
}

funcDBSelectNoParam=function(sqlConnString,sp_sqlstr){
  
  # 使用 odbc driver 連接 SQL SERVER
  sqlconnection=odbcDriverConnect(sqlConnString)
  
  # 組 查詢語法
  sqlstr=paste0(sp_sqlstr)
  
  # 查詢結果
  queryResult=sqlQuery(sqlconnection,sqlstr)
  
  # 關閉 DB 連線
  odbcClose(sqlconnection)
  
  # 回傳 DB 查詢結果
  return(queryResult)
}





