complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        file_list <- list()
        file_list <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        df_nobs <- data.frame()
        for(i in id) {
                dat <- read.csv(file_list[i])
                df_nobs <- rbind(df_nobs, c(i,sum(complete.cases(dat))))
        }
        names(df_nobs) <- c("id","nobs")
        df_nobs
}