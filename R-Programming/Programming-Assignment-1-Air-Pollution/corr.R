corr  <- function(directory,threshold = 0) {
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  fileList <- list.files("specdata")
  corrValues <- c()
  for(i in 1:length(fileList)){
    
    currentFile <- read.csv(paste("specdata", fileList[i], sep = "/"))
    values <- currentFile[complete.cases(currentFile),]
    
    if(nrow(values)>threshold){    
      corrValues <- c(corrValues, cor(values$nitrate,values$sulfate))
    }
  }
  corrValues
}
