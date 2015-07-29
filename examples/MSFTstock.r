## Linear model for MSFT stock dataset ##

# You can use the setwd() command to change your working directory. Examples below
#setwd("C://Users/t-alewa/Documents/Azure-MachineLearning-ClientLibrary-R/examples")
#setwd("C://Users/t-ritra/Documents/Github/Azure-MachineLearning-ClientLibrary-R/test")

# Currently using identification for an account on studio.azureml-int.net
# If you would like to see the web services published, please create an account there
# and substitute in your identification

wsID = "3612640f27234eb7b2b91ac62e8b4a40" #Replace with own workspace ID 
wsAuth = "abcbe14a958a40978f93aa0e0e71f5be" #Replace with own workspace authorization token 

require(quantmod) || install.packages(quantmod)
library(quantmod)

getSymbols('MSFT')
class(MSFT)
chartSeries(MSFT)
str(MSFT)

#plot(MSFT[,1],MSFT[,2])
data = as.data.frame(cbind(MSFT[,4],MSFT[,5]/100000))

# Train model
model = lm(MSFT.Close~.,data=data)
summary(model)

# Create prediction function
MSFTpredict <- function(close, volume) {
  return(predict(model, data.frame("MSFT.Close"=close, "MSFT.Volume"=volume)))
}