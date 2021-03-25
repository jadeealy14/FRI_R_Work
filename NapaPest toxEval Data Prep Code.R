NapaResultsCAS <- merge(NapaResultsCAS, NapaPestSites, by= "SITE_NO", no.dups = TRUE) 

##------ toxEval data file -------
data <- NapaResultsCAS[, colnames(NapaResultsCAS) == "SITE_NO" | colnames(NapaResultsCAS) == "SAMPLE_START_DT" | colnames(NapaResultsCAS) == "CAS.Number" | colnames(NapaResultsCAS) == "RESULT_VA"  ]
data <- data[,c("SITE_NO", "SAMPLE_START_DT", "CAS.Number", "RESULT_VA")]
colnames(data) <- c("SiteID", "Sample Date", "CAS", "Value")

##----- toxEval chemical file ------
chemicals <- NapaResultsCAS[, colnames(NapaResultsCAS) == "PARM_SEQ_GRP_NM" | colnames(NapaResultsCAS) == "CAS.Number"]
colnames(chemicals) <- c("Class", "CAS")

##----- toxEval sites file ----
sites <- NapaResultsCAS[, colnames(NapaResultsCAS) == "SITE_NO" | colnames(NapaResultsCAS) == "DEC_LONG_VA"| colnames(NapaResultsCAS) == "DEC_LAT_VA" | colnames(NapaResultsCAS) == "RSQA_STUDY.x"]
sites <- sites[, c(1,1,2,3,4)]
colnames(sites) <- c("SiteID", "Short Name", "site_grouping", "dec_lat", "dec_lon")

#Need to figure out how to put "T" in front of the SITEID before I convert to excel 

##----- convering above files into excel sheet -----
write.csv(data, "NapaToxEval_data.csv")
write.csv(chemicals, "NapaToxEval_chemicals.csv")
write.csv(sites, "NapaToxEval_sites.csv")
