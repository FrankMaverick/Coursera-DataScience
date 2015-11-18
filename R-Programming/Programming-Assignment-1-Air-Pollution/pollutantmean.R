
pollutantmean <- function(directory, pollutant, id = 1:332) {
  #get the file List in that directory
  fileList <- sort(list.files(directory))
  
  #initialize pollutantValues vector
  pollutantValues <- c()
  for(i in id){
    currentFile <- read.csv(paste(directory, fileList[i], sep = "/"))
    pollutantValues <- c(pollutantValues,na.omit(currentFile[[pollutant]]))
  }
  return(mean(pollutantValues))
}
