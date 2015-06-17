complete <- function(directory, id = 1:332) {
  
  filesList <- (Sys.glob(file.path(directory, '*.csv')));
  nobs <- c();
  
  for (index in id) {
    file_data <- read.csv(filesList[index], sep = ",");
    complete_cases <- file_data[complete.cases(file_data),];
    nobs <- c(nobs, nrow(complete_cases));
  }
  
  return(data.frame(cbind(id, nobs)));
}