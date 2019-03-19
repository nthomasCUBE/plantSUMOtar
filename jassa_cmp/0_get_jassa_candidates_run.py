seq={}
fh=open("../Arabidopsis_thaliana.TAIR10.pep.all.fa/Arabidopsis_thaliana.TAIR10.pep.all.fa")
for line in fh.readlines():
    line=line.strip()
    if(line.find(">")!=-1):
        cid=line[1:].split(".")[0]
        seq[cid]=""
    else:
        seq[cid]=seq[cid]+line

for seq_ in seq:
    #print(seq_)
    pass

print(len(seq.keys()))

import re

motif=[]
motif.append("[ILV][ILV][^ILV][ILV]")
motif.append("[ILV][^ILV][ILV][ILV]")
motif.append("[ILV][ILV][ILV][ILV]")
motif.append("[^ILV][ILV][ILV][ILV]")
motif.append("[DE][ILV][DE][ILV]")
motif.append("[ILV][DE][ILV][DE]")
motif.append("[VI][^VI][VI][VI]")
motif.append("[VI][VI][^VIL][VIL]")
motif.append("[PILVM][ILVM][^PILVM][ILVM][DES]{3}")
motif.append("[PILVMFY][ILVM][D][L][T]")
motif.append("[DES]{3}[ILVM][^ILVMF][ILVMF]{3}")
motif.append("[K][^K]{3,5}[IV][IL][IL][^IL]{3}[DEQN][DE]{2}")
motif.append("[ILV]{2}[^ILV][S][^ILV][ST][DE]{3}")

ALL={}
for seq_ in seq:
    for motif_ in motif:
        m = re.match(motif_,seq[seq_].upper())
        if(m!=None):
            ALL[seq_]=1

print(len(ALL.keys()))

fw=open("JASSA.txt","w")
for ALL_ in ALL:
    fw.write(ALL_+"\n")
fw.close()


