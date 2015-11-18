complete  <- function(directory, id = 1:332) {
  #get the file List in that directory
  fileList <- sort(list.files(directory))
  
  #initialize nrows vector
  nrows <- c()
  
  for(i in id){
    currentFile <- read.csv(paste(directory, fileList[i], sep = "/"))
    nrows <- c(nrows, sum(complete.cases(currentFile)))
  }
  data.frame(id, nobs = nrows)
}
