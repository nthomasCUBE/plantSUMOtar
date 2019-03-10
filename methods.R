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

	d2=read.csv("A.NIHMS316063-supplement-Table_S4.txt",sep="\t")
	u_g=unique(c(data[,1],data[,2]))
	print(u_g)
	
	for(x in 1:length(u_g)){
		print(u_g[x])
	}
}

