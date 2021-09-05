if(!("installr" %in% rownames(installed.packages()))){
  install.packages("installr")
}
require(installr)

if(check.for.updates.R()){
  install.R()
}else{
  version
}