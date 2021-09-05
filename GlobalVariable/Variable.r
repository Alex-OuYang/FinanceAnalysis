# 清除所有環境變數
rm(list=ls())

# 初始系統編碼
encodingStr="utf-8"
#Sys.setenv(TZ = "Asia/Taipei")

# 設定初始資料夾位置
projectPathStr="C:/Users/alex1/Desktop/FinanceAnalysis"
setwd(projectPathStr)

# 各檔案列表
# 變數
variablestr=paste0(projectPathStr,"/GlobalVariable/Variable.r")

# Func
funcDBSelectstr=paste0(projectPathStr,"/Function/FuncDBSelect.r")
funcStockInfoToTimeSerialstr=paste0(projectPathStr,"/Function/FuncStockInfoToTimeSerial.r")
funcKDCrossstr=paste0(projectPathStr,"/Function/FuncKDCross.r")
funcGetStockDatastr=paste0(projectPathStr,"/Function/FuncGetStockData.r")

# TradeRule
tradeRuleKD=paste0(projectPathStr,"/TradeRule/KD_Golden.r")

# Finance 參數
stockno='2330'
startDate="2010-01-01"
endDate="2021-08-07"
dateInterval=paste0(startDate,"/",endDate)
stockclass="股票"

# 連接 DB 參數
sqlConnString = "driver={SQL Server};server=ALEX-NB\\SQLEXPRESS;database=Finance;;Trusted_Connection=Yes" 

# SQL 語法
sp_sqlstr_SECURITYINFO="EXEC sp_GET_SECURITYINFO "
sp_sqlstr_COMPANYCLASS="EXEC sp_GET_COMPANYCLASS"
sp_sqlstr_COMPANYLIST="EXEC sp_GET_COMPANYLIST "

