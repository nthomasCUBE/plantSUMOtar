library(d3heatmap)
library(gplots)
library(officer)
library(scales)

options(stringsAsFactors=FALSE)

print_genes=function(v){
	print(paste0("INFO","print_genes"))
	data=read.csv(v$file1,header=FALSE)
	my_tar=data[,1]

	d1=read.csv("C.Search_Space_1.txt",header=FALSE,sep="\t")
	d1=unique(d1[,2])
	g_main1=my_tar[my_tar%in%d1]
	print(paste0(c("shared genes in A1MAIN",length(g_main1))))
	print(head(d1))

	d2=read.csv("A.NIHMS316063-supplement-Table_S4.txt",sep="\t")
	u_g=unique(c(d2[,1],d2[,2]))
	print(c("total_protein",length(u_g)))
	
	df=data.frame()
	for(x in 1:length(u_g)){
		D=subset(d2,d2[,1]%in%u_g[x] | d2[,2]%in%u_g[x])
		all_g=unique(c(D[,1],D[,2]))
		if(u_g[x]%in%g_main1){
			df=rbind(df,c("targets",length(all_g),u_g[x]))
		}else{
			df=rbind(df,c("non-targets",length(all_g),u_g[x]))
		}
	}
	colnames(df)=c("category","nmb_connected_genes","athal_protein")
	print(head(df))
	
	
	qt=quantile(as.integer(df[,2]),0.99)
	print(qt)


	print(subset(df,as.integer(df[,2])>qt))
	
	library(ggplot2)


	print(wilcox.test(as.integer(df[,2])~df[,1]))
	p <- ggplot(df, aes(x=category, y=as.integer(nmb_connected_genes))) + geom_boxplot()+ coord_trans(y = "log10")
	return(p)
}

