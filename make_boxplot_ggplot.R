	options(stringsAsFactors=FALSE)

	data=read.csv("gene_copy_ovl.txt",sep="\t",header=T)
	cn=colnames(data)
	df=data.frame()
	for(x in 1:dim(data)[1]){
		for(y in 3:dim(data)[2]){
			df=rbind(df,c(data[x,1],cn[y],data[x,y]))
		}
	}
	df[,3]=as.double(df[,3])
	df_o=df
	colnames(df)=c("gene","species","gene_number")
	df<-ggplot(df, aes(x = gene, y = gene_number))+geom_boxplot()
	df=df+scale_y_continuous(name = "Gene copy numbers")
	df=df+geom_jitter()
	u_d=unique(df_o[,1])
	for(x in 1:length(u_d)){
		s_u_d=subset(df_o,df_o[,1]==u_d[x])
		print(c(u_d[x],mean(s_u_d[,3]),sd(s_u_d[,3])))
	}
