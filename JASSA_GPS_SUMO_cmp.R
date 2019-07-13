function(){

	options(stringsAsFactors=FALSE)

	if(!exists("df1")){
		print("load d1")
		d1=read.csv("JASSA_2019_06_25.txt",sep="\t",header=T,dec=",")
		data=d1
		for(x in 1:dim(data)[1]){
			data[x,1]=strsplit(data[x,1],"\\.")[[1]][1]
		}
		df1<<-data.frame(data[,1],data[,4])
	}

	if(!exists("df2")){
		print("load d2")
		d2=read.csv("GPS-SUMO_16jun19",sep="\t",header=T)
		data=d2
		for(x in 1:dim(data)[1]){
			data[x,1]=strsplit(data[x,1],"\\.")[[1]][1]
		}
		df2<<-data.frame(data[,1],data[,4])
	}

	gid=unique(df1[,1],df2[,1])
	A=c()
	B=c()
	C=c()
	for(x in 1:length(gid)){
		d1=subset(df1,df1[,1]==gid[x]); d1=max(d1[,2]);
		d2=subset(df2,df2[,1]==gid[x]); d2=max(d2[,2]);
		if(!is.na(d1) && !is.na(d2)){
			A=c(A,d1);
			B=c(B,d2);
			C=c(C,gid[x]);
		}
	}
	B[B==-Inf]=0
	print(summary(A))
	print(summary(B))
	plot(A,B,xlab="JASSA",ylab="GPS-SUMO")
	print(cor(A,B))

	df=data.frame(A,B,C)
	write.table(df,"JASSA_GPS_SUMO_cmp.txt")
	df=subset(df,df[,1]>16 & df[,2]>70)
	write.table(unique(df[,3]),"bla.txt")
	
}
