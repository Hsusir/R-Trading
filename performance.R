### Performance Module, Drawing ##
### INPUT profit vector

STKcol="lightblue"
PfCol="darkorange1"
DDcol="darkgreen"

performance=function (profit){

DD=rep(0,length(profit))	## Draw Down
topprofit=rep(profit[1],length(profit))	## temp maximum profit

for (m in 2:length(profit)){
	if (sum(profit[1:m])>topprofit[m-1]){
	topprofit[m:length(profit)]=sum(profit[1:m])} ## setting top profit

	DD[m]=sum(profit[1:m])-topprofit[m]	## current draw down
}


plot(DD,type="h",col=DDcol,lwd=2,ylab="Cumulative Profit & DrawDown",xlab="Trading Days",font=2
,main=paste(names(profit)[1],"~",names(profit)[length(profit)]),ylim=c(min(DD),max(cumsum(profit))))
par(new=T)
plot(cumsum(profit),type="h",col=PfCol,lwd=2,ylab="Cumulative Profit & DrawDown",xlab="Trading Days",font=2
,main=paste(names(profit)[1],"~",names(profit)[length(profit)]),ylim=c(min(DD),max(cumsum(profit))))

TPT=rep(1,1);i=1

for (m in 2:length(profit)){
	if (topprofit[m]>topprofit[m-1]){points(m,topprofit[m],pch=4,col="purple")
	TPT[i]=m
	i=i+1}
}

DDT=rep(TPT[1],1)

if (length(TPT)>=2){for (i in 2:length(TPT)){DDT[i]=TPT[i]-TPT[i-1]}}else{
DDT=length(profit)}

Cl=Cl(STK)
par(new=T)

plot(Cl,type="l",col=STKcol,lwd=2,font=2,xlab="Trading Days",ylab="Cumulative Profit & DrawDown"
,xaxt = "n",yaxt = "n")

STK.by=floor((max(Cl)-min(Cl))/12)
axis(4,seq(min(Cl),max(Cl),by=STK.by),col="black",lwd=2,font=2)

cat(" Total Profit:",sum(profit),"\n"
,"Trading Days:",length(profit),"\n"
,"Profit Per Trade:",sum(profit)/length(profit[profit!=0]),"\n"
,"# of Win:",length(profit[profit>0]),"\n"
,"Win Rate:",length(profit[profit>0])*100/length(profit[profit!=0]),"%","\n"
,"Winning Average:",mean(profit[profit>0]),"\n"
,"Lossing Average:",mean(profit[profit<0]),"\n"
,"Maximum Draw Down:",abs(min(DD)),"\n"
,"The Periods of MDD:",tail(sort(DDT),5),"\n"
,"Profit Factor:",sum(profit[profit>0])/-sum(profit[profit<0]),"\n"
,"Total Profit/MDD:",sum(profit)/abs(min(DD)),"\n")
}


ProfitBar=function (profit){

profitPos=setNames(numeric(length(profit)),names(profit))
profitNeg=profitPos

for (m in names(profit)){
if (profit[[m]]>0){profitPos[[m]]=profit[[m]]}
if (profit[[m]]<0){profitNeg[[m]]=profit[[m]]}
}

plot(profitPos,type="h",col="red",ylim=c(min(profit),max(profit))
,xlab="Trading Days",ylab="Profit",main=paste(names(profit)[1],"~",names(profit)[length(names(profit))]))
par(new=T)
plot(profitNeg,type="h",col="darkgreen",ylim=c(min(profit),max(profit))
,xlab="Trading Days",ylab="Profit",font=2)

}