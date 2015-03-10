pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  # data_vector contains all data for related to the id vector parameter
  data_vector <- vector()
  
  for(i in seq_along(id)) {
    # generate file path for set of files to open; add leading 0's to filename when needed
    file_path = paste(c(directory, "/", sprintf("%03d", id[i]), ".csv"), collapse = "")
    #print(file_path)
    
    # read contents of file into data
    data <- read.csv(file_path)
    
    # append contents of current file to total superset of data
    data_vector <- append(data_vector, data[ , pollutant])
  }
  
  #print(data_vector)
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  mean(data_vector, na.rm = TRUE)
}