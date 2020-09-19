library(modules)
library(rlang)
load.train <- modules::module({   
    modules::import("magrittr", "%>%") 
    modules::import("dplyr", "select_if", "select", "mutate", "arrange") 
    
    #Loading data functions
    
    train.data <- function() { 
        setwd("C:/Users/iceca/Documents/Housing_Regression")
        load( "Data/RDAs/Train.rda")
        train$isTrain <- NULL
        return(train)
    } 
    test.data <- function() { 
        setwd("C:/Users/iceca/Documents/Housing_Regression")
        load( "Data/RDAs/Test.rda")
        return(test)
    } 
    trim.data <- function() {
        setwd("C:/Users/iceca/Documents/Housing_Regression")
        load( "Data/RDAs/TrimFeatEngTrain.rda")
        load( "Data/RDAs/TrimFeatEngTest.rda")
        return( list(tr, tst) )
    }
    norm.data <- function() {
        setwd("C:/Users/iceca/Documents/Housing_Regression")
        load( "Data/RDAs/NormFeatEngTrain.rda")
        load( "Data/RDAs/NormFeatEngTest.rda")
        return( list(tr, tst) )
    }
    skew.data <- function() {
        setwd("C:/Users/iceca/Documents/Housing_Regression")
        load( "Data/RDAs/FeatEngTrain.rda")
        load( "Data/RDAs/FeatEngTest.rda")
        return( list(tr, tst) )
    }
    featEngRaw.data <- function() {
        setwd("C:/Users/iceca/Documents/Housing_Regression")
        load( "Data/RDAs/RawFeatEngTrain.rda")
        load( "Data/RDAs/RawFeatEngTest.rda")
        return( list(train, test) )
    }
    no.outliers.data <- function() { 
        setwd("C:/Users/iceca/Documents/Housing_Regression")
        load( "Data/RDAs/TrainNoOutlierRaw.rda")
        train$isTrain <- NULL
        return(train)
    } 
    get.labels <- function() {
        setwd("C:/Users/iceca/Documents/Housing_Regression")
        load( "Data/RDAs/Labels.rda")
        return(labels)
    }
    
    #organizing data frames helpers
    
    nums.data <- function() {
        dat <- train.data()
        dat %>% select_if(is.numeric)
    }
    
    drop.id <- function(dat) {
        dat %>% select(-Id)
    }
    factors.data <- function() {
        dat <- train.data()
        dat %>% select_if(is.factor) %>% mutate(Id = nums.data()$Id)
    }
    nums.data.standardize <- function(dat = nums.data()) {
        drop.id(dat) %>% scale() %>% as.data.frame() %>% mutate(Id = dat$Id)
    }
    combine.columns <- function(l = list(nums.data.standardize() , factors.data() )) {
        dat <- data.frame(Id = l[[1]]$Id)
        for (p in l){
            dat <- cbind(dat %>% arrange(Id),p %>% arrange(Id) %>% select(-Id) )
        }
        dat
    }
    
})
