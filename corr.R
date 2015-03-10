corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  corr_results <- vector(mode = "numeric")
  
  files_list <- list.files(directory, pattern="*.csv", full.names = TRUE)
  
  for(i in seq_along(files_list)) {
    # generate file path for set of files to open; add leading 0's to filename when needed
    file_path = files_list[i]
   
    # read contents of file into data
    data <- read.csv(file_path)

    # number of complete cases in the file
    nobs <- nrow(data[complete.cases(data), ])
  
    if(nobs > threshold) {
      clean_data <- na.omit(data)
      correlation <- cor(clean_data$nitrate, clean_data$sulfate)
      corr_results <- append(corr_results, correlation)
    }
  }
  
  ## Return a numeric vector of correlations
  corr_results
}