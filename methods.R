library(d3heatmap)
library(gplots)
library(officer)
library(VennDiagram)
library(scales)
library(xlsx)

options(stringsAsFactors=FALSE)

print_genes=function(v){
	print(paste0("species=",v$species))
	print(paste0("sumo=",v$sumo))
	
	if(v$species=="arabidopsis"){
		if(v$sumo=="sumo_protein"){
			x1=c("SUMO1","SUMO2","SUMO3","SUMO4","SUMO5","SUMO6","SUMO7","SUMO8")
			x2=c("AT4G26840.1","AT5G55160.2","AT5G55170.1","AT5G48700.1","AT2G32765.1","AT5G48710.1","AT5G55855.1","AT5G55856.1")
			for(x in 1:length(x1)){
				print(c(x1[x],x2[x]))
			}
		}else if(v$sumo=="sumo_e1"){
			x1=c("SAE1","SAE1b","SAE1b","SAE2")
			x2=c("AT4G24940.1","AT5G50580","AT5G50680","AT2G21470.2")
			for(x in 1:length(x1)){
				print(c(x1[x],x2[x]))
			}
		}else if(v$sumo=="sumo_e2"){
			x1=c("SCE1a")
			x2=c("AT3G57870")
			for(x in 1:length(x1)){
				print(c(x1[x],x2[x]))
			}
		}else if(v$sumo=="sumo_e3"){
			x1=c("SIZ1","NSE2","MMS21")
			x2=c("AT5G60410","AT3G15150","AT3G15150")
			for(x in 1:length(x1)){
				print(c(x1[x],x2[x]))
			}
		}else if(v$sumo=="sumo_protease"){
			x1=c("ULP1a","ULP1b","ESD4","ULP1c","ULP1d","ULP2a","ULP2b")
			x2=c("AT3G06910","AT4G00690","AT4G15880","AT1G10570","AT1G60220","AT4G33620","AT1G09730")
			for(x in 1:length(x1)){
				print(c(x1[x],x2[x]))
			}
		}
	}
}

