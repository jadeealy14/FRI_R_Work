ToxCast.Chemical.List <- read.csv("~/Desktop/Urban Ecosystems - Su2020/ToxCast Chemical List.csv")
View(ToxCast.Chemical.List)

install.packages("webchem")
install.packages("devtools")out
library("devtools")
install_github("ropensci/webchem")
library(webchem)

for(i in 1:nrow(NapaPestResults)){
  active <-NapaPestResults$PARM_NM[i]
  if(active != ""){
    casactive <- cts_convert(active, "Chemical name", "cas", match="all")
    names(casactive) <- rep_len(active, length(casactive))
    if(i==1){
      out <- casactive
    }else {
      out <- c(out, casactive)
    }
  }
}

options(max.print = 99999999)
#Increase max output so that I can see my entire CAS # list
out
unlistedout <- unlist(out)
#Expand the CAS # list into something more readable 
test <- unlistedout[out %in% `ToxCast.Chemical.List`$CASRN]
#get chemical name with CAS number attached to it

out %in% `ToxCast.Chemical.List`$CASRN
#Trying to cross-reference CAS numbers from 'out' with CAS numbers in ToxCast; looking for overlap 
#output 
#[1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[15] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[29] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[43] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[57] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[71] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
##Got too many "false" returns, cannot see any "true"
###Going to try to make it return only "true" outputs 

out1 <- out %in% `ToxCast.Chemical.List`$CASRN
#turned above line into data set so that i could input 'out1' into below line to see number of true values
table(out1)["TRUE"]
#output 
#<NA> 
#  NA 

#It looks like last time I did this, the gsub had been so complicated that it was causing issues
#in my code (the above code, starting at line 31 and below) --> Ex: there were multiple parts to a chemical name
#or things weren't gsubed out propery 
#however, my dataset this time is so small and each chemical is only one name, so I don't think this is a problem with my code
#I think I just didn't find any overlap between my dataset and ToxCast 

#It was at this point that I switched to using Barabara's data last semester, so that I could skip all of the 
#cas stuff and start plugging straight into ToxCast
#however, I don't really understand why this didn't work other than just not finding any matches 
#But I'm a little surprised I didn't find any matches --> just searching my 5 chemical names in the ToxCast list, 
#It appears as though I should've found a match for at least "myclobutanil" and "imidacloprid"
#therefore, something must also be wrong with my code or the way I have my data setup, as I don't understand why I didn't find a match for at least 
#those two chemicals 
