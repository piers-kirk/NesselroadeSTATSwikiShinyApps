#### Modeling the CLT with different distributions
#### Piers Kirk, 02.24.21
set.seed(1000000)
number_of_samples = 1000
sample_size = 30

## returns a vector of sample means sampled from a given population distribution
sampling_distribution <- function(pop_dist) {
  sample_dist <- c()
  for (i in 1:number_of_samples) { 
    sample_dist[i] = mean(sample(pop_dist, size=sample_size))
  }
  return(sample_dist)
}

## for each distribution, the code performs the following:
#### line 1: creates the population distribution 
#### line 2: creates the distribution of sample means
#### line 3: creates histograms of both distributions 

##############################################
################## Binomial ##################
##############################################
## TODO
##############################################
################# Chi-Square #################
##############################################
## TODO
##############################################
##################### F ######################
##############################################
## TODO
##############################################
################## Logistic ##################
##############################################
## TODO
##############################################
####### Normal Distribution (Gaussian) #######
##############################################
norm_vec <- rnorm(1000000, mean = 0, sd = 1)  
sample_means_normal <- sampling_distribution(norm_vec) 
hist(norm_vec); hist(sample_means_normal) 
##############################################
################## Poisson ###################
##############################################
poisson_vec <- rpois(1000000, lambda=4) ## TODO: experiment with different lamda values  
sample_means_pois <- sampling_distribution(poisson_vec) 
hist(poisson_vec); hist(sample_means_pois) 
##############################################
################## Student t #################
##############################################
t_vec <- rt(1000000, df=30) ## TODO: experiment with different degrees of freedom   
sample_means_t <- sampling_distribution(t_vec) 
hist(t_vec); hist(sample_means_t) 
##############################################
################## Uniform ###################
##############################################
## TODO

################################################################
################################################################
## REFERENCES
##
## Probability Distributions in R (Stat 5101, Geyer)
## Charles J. Geyer
## 02.24.21
## https://www.stat.umn.edu/geyer/old/5101/rlook.html
##
## Data Science & Statistics Tutorial: The Poisson Distribution
## 365 Data Science 
## 02.24.21
## https://www.youtube.com/watch?v=BbLfV0wOeyc 
##
## Student's T Distribution
## 365 Data Science 
## 02.24.21
## https://www.youtube.com/watch?v=32CuxWdOlow
##
################################################################


