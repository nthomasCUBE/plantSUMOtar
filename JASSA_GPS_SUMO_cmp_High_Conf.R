	d1=read.csv("JASSA_2019_06_25.txt",sep="\t",header=T,dec=",")
	d2=read.csv("GPS-SUMO_16jun19",sep="\t",header=T)

	d1=read.csv("JASSA_2019_06_25.txt",sep="\t",header=T,dec=",")
	data=d1
	for(x in 1:dim(data)[1]){
		data[x,1]=strsplit(data[x,1],"\\.")[[1]][1]
	}
	df1=data

	d2=read.csv("GPS-SUMO_16jun19",sep="\t",header=T)
	data=d2
	for(x in 1:dim(data)[1]){
		data[x,1]=strsplit(data[x,1],"\\.")[[1]][1]
	}
	df2=data

	print("JASSA")
	df1=subset(df1,df1[,6]=="High")
	df1=unique(df1[,1])
	print(length(df1))

	df2=subset(df2,df2[,6]=="SUMO Interaction")
	df2=unique(df2[,1])
	print(length(df2))

	A=df1
	B=df2
	AB=A[A%in%B]
	print(length(AB))

	write.table(AB,"GPS-SUMO_PLUS_JASSA_shared_13jul19.txt",row.names=FALSE,quote=FALSE)
