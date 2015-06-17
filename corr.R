corr <- function(directory, threshold = 0) {
  
  filesList <- (Sys.glob(file.path(directory, '*.csv')));
  
  correlations <- c()
  
  for (file in filesList) {
    file_data <- read.csv(file, sep = ",");
    complete_cases <- file_data[complete.cases(file_data),];
    if (nrow(complete_cases) > threshold) {
      correlations <- c(correlations, cor(complete_cases$sulfate, complete_cases$nitrate))
    }
  }
  
  return(correlations)
}