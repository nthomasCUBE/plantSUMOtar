import re

fh=open("TAIR10_pep_20110103_representative_gene_model_updated")
sq={}
for line in fh.readlines():
    line=line.strip()
    if(line.find(">")!=-1):
        cid=line[1:].split(".")[0]
        sq[cid]=""
    else:
        sq[cid]=sq[cid]+line
print(len(sq.keys()))   

M=[]
#M.append("[ILV][ILV][^ILV][ILV]")
#M.append("[ILV][^ILV][ILV][ILV]")
#M.append("[ILV][ILV][ILV][ILV]")
#M.append("[^ILV][ILV][ILV][ILV]")
#M.append("[ILV][DE][ILV][DE][ILV]")
#M.append("[IV][^IV][VI][^IV][VIL]")
M.append("[PILVM][ILVM][^ILV][ILVM][DES]{3}")
M.append("[PILVMFY][ILVM][D][L][T]")
M.append("[DES]{3}[ILVM][^ILV][ILVMF]{2}")
M.append("[K][^ILV]{3-5}[IV][IL][IL][^ILV]{3}[DEQN][DE]{2}")
M.append("[ILV]{2}[^ILV][S][^ILV][ST][DE]{3}")

all_h={}
mot_freq={}
for sq_ in sq:
    for M_ in M:
        if(re.search("(%s)" % (M_),sq[sq_])):
            matches = re.findall(r'%s' % M_, sq[sq_])
            for match in matches:
                #print(match)
                all_h[sq_]=1
                if(mot_freq.get(M_)==None):
                    mot_freq[M_]={}
                mot_freq[M_][sq_]=1
print(len(all_h.keys()))    

for mot_freq_ in mot_freq:
    print(mot_freq_+":"+str(len(mot_freq[mot_freq_]))+"\n")
fw=open("JASSA_Motifs_output.txt","w")
for all_h_ in all_h:
    fw.write(all_h_+"\n")
fw.close()



