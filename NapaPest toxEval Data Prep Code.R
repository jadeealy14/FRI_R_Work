NapaResultsCAS <- merge(NapaResultsCAS, NapaPestSites, by= "SITE_NO", no.dups = TRUE) 

##------ toxEval data file -------
data <- NapaResultsCAS[, colnames(NapaResultsCAS) == "SITE_NO" | colnames(NapaResultsCAS) == "SAMPLE_START_DT" | colnames(NapaResultsCAS) == "CAS.Number" | colnames(NapaResultsCAS) == "RESULT_VA"  ]
data <- data[,c("SITE_NO", "SAMPLE_START_DT", "CAS.Number", "RESULT_VA")]
colnames(data) <- c("SiteID", "Sample Date", "CAS", "Value")

data$SiteID <- as.character(data$SiteID) 
str(data$SiteID) 
data$SiteID <- paste0('T', data$SiteID) 
View(data) 

##----- toxEval chemical file ------
chemicals <- NapaResultsCAS[, colnames(NapaResultsCAS) == "PARM_SEQ_GRP_NM" | colnames(NapaResultsCAS) == "CAS.Number"]
colnames(chemicals) <- c("Class", "CAS")
View(chemicals)

##----- toxEval sites file ----
sites <- NapaResultsCAS[, colnames(NapaResultsCAS) == "SITE_NO" | colnames(NapaResultsCAS) == "DEC_LONG_VA"| colnames(NapaResultsCAS) == "DEC_LAT_VA" | colnames(NapaResultsCAS) == "RSQA_STUDY.x"]
sites <- sites[, c(1,1,2,3,4)]
colnames(sites) <- c("SiteID", "Short Name", "site_grouping", "dec_lat", "dec_lon")

#sites$SITEID <- NULL / accidentally added a column to my dataframe, and this is the code to delete columns from dataframes

#Need to figure out how to put "T" in front of the SITEID before I convert to excel 
sites$SiteID <- as.character(sites$SiteID) #first have to convert from numeric --> character
str(sites$SiteID) #double check that it converted to character correctly
sites$SiteID <- paste0('T', sites$SiteID) #code to add T into "SiteID"
View(sites) #reload sites to view "T" 

##----- convering above files into excel sheet -----
write.csv(data, "NapaToxEval_data.csv")
write.csv(chemicals, "NapaToxEval_chemicals.csv")
write.csv(sites, "NapaToxEval_sites.csv")

##----- load data -----
library(toxEval)

setwd("/Users/jadeealy/R work/toxEval sheets/")

library(readxl)
read_excel("NapaToxEvalData+Chemicals+Sites.xlsx")

path_to_tox <- system.file("extdata", package="toxEval")
tox_list <- create_toxEval("NapaToxEvalData+Chemicals+Sites.xlsx")


##---- next step after loading data -------
ACC <- get_ACC(tox_list$chem_info$CAS)
ACC <- remove_flags(ACC)

cleaned_ep <- clean_endPoint_info(end_point_info)
filtered_ep <- filter_groups(cleaned_ep)

chemical_summary <- get_chemical_summary(tox_list, ACC, filtered_ep)

plot_tox_boxplots(chemical_summary, "Biological")

plot_tox_stacks(chemical_summary, 
                chem_site = tox_list$chem_site, 
                category =  "Biological")

#I got some data, but the data looks really messed up. I don't think it ran correctly. The chemical summary looks weird. 
#Need to look into this later. 