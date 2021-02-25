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
################## Bernoulli #################
##############################################
## one T/F question on a quiz 
bern_dist_vec <- rbinom(1000000, size = 1, prob=0.9)
sample_means_bern <- sampling_distribution(bern_dist_vec) 
hist(bern_dist_vec); hist(sample_means_bern) 
##############################################
################## Binomial ##################
##############################################
## all questions on the T/F quiz 
bern_dist_vec <- rbinom(1000000, size = 10, prob=0.9)
sample_means_bern <- sampling_distribution(bern_dist_vec) 
hist(bern_dist_vec); hist(sample_means_bern) 
##############################################
################# Chi-Square #################
##############################################
chi_dist_vec <- rchisq(1000000, df = 30)
sample_means_chi <- sampling_distribution(chi_dist_vec) 
hist(chi_dist_vec); hist(sample_means_chi) 
##############################################
##################### F ######################
##############################################
f_dist_vec <- rf(1000000, df1 = 30, df2 = 20)
sample_means_f <- sampling_distribution(f_dist_vec) 
hist(f_dist_vec); hist(sample_means_f) 
##############################################
################## Logistic ##################
##############################################
## a logistic distribution is defined by two key parameters: 1.) mean 2.) scale
## "The main difference between the normal distribution and the logistic 
## distribution lies in the tails and in the behavior of the failure rate
## function. The logistic distribution has slightly longer tails compared 
## to the normal distribution." - https://www.weibull.com/hotwire/issue56/relbasics56.htm#:~:text=The%20main%20difference%20between%20the,compared%20to%20the%20normal%20distribution.
log_vec <- rlogis(1000000)
sample_means_log <- sampling_distribution(log_vec) 
hist(log_vec); hist(sample_means_log) 
##############################################
####### Normal Distribution (Gaussian) #######
##############################################
norm_vec <- rnorm(1000000, mean = 0, sd = 1)  
sample_means_normal <- sampling_distribution(norm_vec) 
hist(norm_vec); hist(sample_means_normal) 
##############################################
################## Poisson ###################
##############################################
## lambda: per unit time what is the average amount of occurrences that you think the event will happen
## QUESTION: https://www.geeksforgeeks.org/compute-randomly-drawn-poisson-density-in-r-programming-rpois-function/ 
poisson_vec <- rpois(1000000, lambda = 4)  
sample_means_pois <- sampling_distribution(poisson_vec) 
hist(poisson_vec); hist(sample_means_pois) 
##############################################
################## Student t #################
##############################################
## df (degrees of freedom): number of independent pieces of information needed in order to make a calculation 
t_vec <- rt(1000000, df=30) ## TODO: experiment with different degrees of freedom   
sample_means_t <- sampling_distribution(t_vec) 
hist(t_vec); hist(sample_means_t) 
##############################################
################## Uniform ###################
##############################################
## uniform distribution: all outcomes have equal probability 
uni_vec <- runif(n = 1000000, min = 0, max = 100) 
sample_means_uni <- sampling_distribution(uni_vec) 
hist(uni_vec); hist(sample_means_uni) 
##############################################
##############################################
##############################################


################################################################
################################################################
## REFERENCES
##
## Probability Distributions in R (Stat 5101, Geyer)
## Charles J. Geyer
## 02.24.21
## https://www.stat.umn.edu/geyer/old/5101/rlook.html
##
## Bernoulli Distribution
## 365 Data Science
## 02.24.21
## https://www.youtube.com/watch?v=nl9WiZMZnYs&t=6s
##
## Probability: Binomial Distribution
## 365 Data Science
## 02.24.21
## https://www.youtube.com/watch?v=_FbZI9mtSSM 
##
## jbstatistics 
## 02.24.21
## https://www.youtube.com/watch?v=hcDb12fsbBU
##
## An Introduction to the Chi-Square Distribution
## An Introduction to the F Distribution 
## jbstatistics
## 02.24.21
## https://www.youtube.com/watch?v=G_RDxAZJ-ug
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
## Introduction to Discrete Uniform Distribution
## 365 Data Science 
## 02.24.21 
## https://www.youtube.com/watch?v=3C9mpj-NYgo 
## 
################################################################


