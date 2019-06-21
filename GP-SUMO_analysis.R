function(){
	options(stringsAsFactors=FALSE)

	data=read.csv("GPS-SUMO_16jun19",sep="\t",header=T)
	plot(sort(data$Score))
	abline(h=quantile(data$Score,0.995))
	c_of=(quantile(data$Score,0.995))
	my_g=(data[data$Score>c_of,1])
	print(my_g)
	for(x in 1:length(my_g)){
		my_g[x]=strsplit(my_g[x],"\\.")[[1]][1]
	}
	my_g=unique(my_g)
	write.table(my_g,"GPSSUMP_quantil99perc.txt",row.names=FALSE,quote=FALSE)
}
