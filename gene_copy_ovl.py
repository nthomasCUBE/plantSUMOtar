import sys

allowed={}
fh=open("file1_athal_genes.txt")
for line in fh.readlines():
    line=line.strip()
    vals=line.split("\t")
    if(len(vals)>1):
        gg=vals[1].split("/")
        for gg_ in gg:
            allowed[gg_.split(".")[0]]=1

for allowed_ in allowed:
    print("file1_athal_genes::"+allowed_)
    
fh=open("Compara.96.protein_default.homologies.tsv")
MAP={}
ALL_O={}
print("started...")
for line in fh.readlines():
    line=line.strip()
    vals=line.split("\t")
    if(MAP.get(vals[0])==None):
        MAP[vals[0]]={}
    if(MAP[vals[0]].get(vals[7])==None):
        MAP[vals[0]][vals[7]]={}
    MAP[vals[0]][vals[7]][vals[5]]=1
    ALL_O[vals[7]]=1
print("stopped...")


fw=open("gene_copy_ovl.txt","w")
arr=[]
arr.append("Athal"),
for ALL_O_ in ALL_O:
    arr.append(ALL_O_),
fw.write("\t".join(arr)+"\n")
for allowed_ in allowed:
    arr=[]
    arr.append(allowed_)
    for ALL_O_ in ALL_O:
        if(MAP.get(allowed_)!=None and MAP[allowed_].get(ALL_O_)!=None):
            arr.append(str(len(MAP[allowed_][ALL_O_].keys())))
        else:
            arr.append("0")
    fw.write("\t".join(arr)+"\n")
fw.close()

fh=open("gene_copy_ovl.txt")
for line in fh.readlines():
    line=line.strip()
    print(line)
    

    
            
        




