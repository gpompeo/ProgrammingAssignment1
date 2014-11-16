corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        file_list <- list()
        file_list <- list.files(directory, full.names = TRUE)
        df_corr <- data.frame()
        results <- numeric()
        
        df_complete  <- complete("specdata")
        id  <- df_complete[df_complete$nobs>threshold,"id"]
        
        for(i in id) {
                df_corr <- read.csv(file_list[i])
                results <- c(results, cor(df_corr$nitrate,df_corr$sulfate,use="complete.obs"))
        }
        results
}