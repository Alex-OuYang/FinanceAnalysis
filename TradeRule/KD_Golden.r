library(quantmod)

source(funcGetStockDatastr)
stockDS=funcGetStockData(sqlConnString,sp_sqlstr_SECURITYINFO,stockno,dateInterval)
# View(stockDS)

# RSV (Cl(i) - min(Cl[i:i+8])) / (max(Cl[i:i+8]) - min(Cl[i:i+8]))
# K = (2/3)*(昨日K值)+(1/3)*(今日RSV)
# D = (2/3)*(昨日D值)+(1/3)*(今日K)

rsvSeed=8
i=9
maxCl=c(rep(0,rsvSeed))
minCl=c(rep(0,rsvSeed))
rsv=c(rep(0,rsvSeed))
K=c(rep(0,rsvSeed))
D=c(rep(0,rsvSeed))

# 策略：買=> KD 黃金交叉 & (連 3 天 KD >80)
# 策略：賣=> KD 死亡交叉 & (連 3 天 KD <20)
isGolden=c(rep(0,rsvSeed))

while (i <= nrow(stockDS)) {
  cl=Cl(stockDS[i,])
  maxCl=c(maxCl,max(Cl(stockDS[(i-8):(i)])))
  minCl=c(minCl,min(Cl(stockDS[(i-8):(i)])))
  rsv=c(rsv,((cl-minCl[i])/(maxCl[i]-minCl[i]))*100)
  K=c(K,((K[(i-1)]*(2/3)+rsv[i]*(1/3))))
  D=c(D,((D[(i-1)]*(2/3)+K[i]*(1/3))))
  
  if(i>9){
    # 黃金交叉
    if((K[(i-1)] <= D[(i-1)]) && (K[(i)] > D[(i)])){
      # 連 3 天 KD >80
      if((K[(i-2)]>80 && D[(i-2)]>80) && (K[(i-1)]>80 && D[(i-1)]>80) && (K[(i)]>80 && D[(i)]>80)){
        isGolden=c(isGolden,1)
      }else{
        isGolden=c(isGolden,0) # 非買賣點補0
      }
    }else if ((K[(i-1)] >= D[(i-1)]) && (K[(i)] < D[(i)])){ #死亡交叉
      # 連 3 天 KD <20
      if((K[(i-2)]<20 && D[(i-2)]<20) && (K[(i-1)]<20 && D[(i-1)]<20) && (K[(i)]<20 && D[(i)]<20)){
        isGolden=c(isGolden,-1)
      }else{
        isGolden=c(isGolden,0) # 非買賣點補0
      }
    }else{
      isGolden=c(isGolden,0) # 非買賣點補0
    }
  }else{
    isGolden=c(isGolden,0) # 非買賣點補0
  }

  i=i+1
}

KDDS=cbind(stockDS,maxCl,minCl,rsv,K,D,isGolden)
colnames(KDDS)=c("Open","High","Low","Close","Volume","RSVMax","RSVMin","RSV","K","D","isGolden")
View(KDDS)



