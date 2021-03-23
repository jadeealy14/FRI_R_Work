NapaPestResults <- merge(NapaChemCas, NapaChemCas[,c("Chemical.Name", "CAS.Number")], by = "Chemical.Name")
#tried to add a column to my data and accidentally overwrote my dataframe 
#try using leftjoin, fulljoin, rightjoin, etc 
#using fulljoin will not get rid of anything --> different names? by = c("whatever the first column is" == "the other column name") 