#Remove everything out of chemical names except the chemical name using gsub 
NapaPestResults$PARM_NM <- gsub(", w,gf<0.7u", "", NapaPestResults$PARM_NM)
NapaPestResults$PARM_NM <- gsub(", w,gf<.7u", "", NapaPestResults$PARM_NM)
NapaPestResults$PARM_NM <- gsub(", wf", "", NapaPestResults$PARM_NM)
