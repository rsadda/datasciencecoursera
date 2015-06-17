pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Load all file paths into files object from the directory specified.  
  filesList <- Sys.glob(file.path(directory, '*.csv'))[id]; 
  #files
  #To get the required data
  result_data <- c()
  
  #Reading pollutant column values from each file
  for (file in filesList) {
    file_data <- read.csv(file, sep = ",");
   # pollutant_data <- file_data[!is.na(file_data[,pollutant])]
    pollutant_data <- file_data[,pollutant];
    pollutant_data <- pollutant_data[!is.na(pollutant_data)]
    result_data <- c(result_data, pollutant_data)
  }
  
  return(mean(result_data));
}
