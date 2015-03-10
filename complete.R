complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  # empty dataframe for result of ids and nobs
  df <- data.frame(id = integer(0), nobs = integer(0)) 
  
  for(i in seq_along(id)) {
    # generate file path for set of files to open; add leading 0's to filename when needed
    file_path = paste(c(directory, "/", sprintf("%03d", id[i]), ".csv"), collapse = "")
    #print(file_path)
    
    # read contents of file into data
    data <- read.csv(file_path)
    
    # add id and nobs of current file into dataframe
    df <- rbind(df, data.frame(id = id[i], nobs = nrow(data[complete.cases(data), ])))
  }

  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  df
}