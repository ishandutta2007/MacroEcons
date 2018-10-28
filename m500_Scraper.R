library(htmltab)
require(ggplot2)
require(reshape2)
df <- data.frame()
url <- "file:///Users/ishandutta2007/Desktop/MC500_1000_"
for(i in 1:5){
  dt <- htmltab(doc = paste0(url,i,".html"), which = "/html/body/table")
  df <- rbind(df, dt)
}

colnames(df) <- c("Sln",
                  "Namename" ,
                  "CurrentPrice",
                  "CurrentMarketCap",
                  "CurrentMarketCapToSales",
                  "PEG",
                  "PEP",
                  "Profit5",
                  "Sales5",
                  "ROE5",
                  "DE")

df$CurrentPrice<- as.numeric(gsub(",", "", df$CurrentPrice))
df$CurrentMarketCap<- as.numeric(gsub(",", "", df$CurrentMarketCap))
df$CurrentMarketCapToSales<- as.numeric(gsub(",", "", df$CurrentMarketCapToSales))
df$PEG<- as.numeric(gsub(",", "", df$PEG))
df$PEP<- as.numeric(gsub(",", "", df$PEP))
df$Profit5<- as.numeric(gsub(",", "", df$Profit5))
df$Sales5<- as.numeric(gsub(",", "", df$Sales5))
df$ROE5<- as.numeric(gsub(",", "", df$ROE5))
df$DE100<- 100*as.numeric(gsub(",", "", df$DE))
df$PriorMarketCap <- df$CurrentMarketCap/((df$Profit5+100)/100)^5
df <- df[complete.cases(df), ]


df2 <- df[,c("DE100", "ROE5","Sales5","Profit5","CurrentMarketCap", "PriorMarketCap")]
#df2 <- df2[df2$PriorMarketCap < 1000,]
#df2 <- df2[df2$Sales5 < 100,]
#df2 <- df2[df2$Profit5 < 100,]
#df2 <- df2[df2$Profit5 > 40,]
#df2 <- melt(df2 ,  id.vars = 'Profit5', variable.name = 'series')
# ggplot(df2, aes(Profit5,value)) + geom_line(aes(colour = series))