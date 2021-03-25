NapaPestResults <- merge(NapaChemCas, NapaChemCas[,c("Chemical.Name", "CAS.Number")], by = "Chemical.Name")
#tried to add a column to my data and accidentally overwrote my dataframe 
#try using leftjoin, fulljoin, rightjoin, etc 
#using fulljoin will not get rid of anything --> different names? by = c("whatever the first column is" == "the other column name") 

NapaResultsCAS <- merge(NapaPestResults1, NapaChemCas, by = "PARM_NM")
#I think the "by=" needs to list a column that both datasets have 
#I am going to rename "Chemical.Name" to "PARM_NM" to match column in NapaPestResults1

# get column names
colnames(NapaChemCas)
# Rename column where names is "Chemical.Name"
names(NapaChemCas)[names(NapaChemCas) == "Chemical.Name"] <- "PARM_NM"

#Now going to retry the merge 
NapaResultsCAS <- merge(NapaPestResults1, NapaChemCas, by = "PARM_NM")
#it worked!! I am so excited!! 