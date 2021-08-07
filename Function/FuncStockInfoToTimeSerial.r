if(!("quantmod" %in% rownames(installed.packages()))){
  install.packages("quantmod")
}
require(quantmod)

funcStockInfoToTimeSerial=function(queryResult){

  # 轉為 numeric 型態
  queryResult[,3]=as.numeric(queryResult[,3]) #Open
  queryResult[,4]=as.numeric(queryResult[,4]) #High
  queryResult[,5]=as.numeric(queryResult[,5]) #Low
  queryResult[,6]=as.numeric(queryResult[,6]) #Close
  queryResult[,7]=as.numeric(queryResult[,7]) #Close
  
  Sys.setenv(TZ = "Asia/Taipei")
  
  # 轉換日期為時間序列格式
  timeCharVector = as.character(queryResult[,2])
  timeVector=strptime(timeCharVector,"%Y-%m-%d",tz=Sys.timezone())
  timeVector=as.POSIXct(timeVector)
  
  # 將資訊結合，X軸為 時間序列
  stock=cbind(queryResult[,3],queryResult[,4],queryResult[,5],queryResult[,6],queryResult[,7])
  stock=xts(stock,as.POSIXct(timeVector))
  
  # 宣告欄位名稱
  colnames(stock)=c("Open","High","Low","Close","Volume")

  return(stock)
  
}


