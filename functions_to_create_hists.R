set.seed(1) ## every random value produced will be the same
population_size = 100000


### each column contains a vector representing a different pop dist the user can choose from
distributions_df <- data.frame(
  "Bernoulli" = rbinom(population_size, size = 1, prob = 0.63),
  "Bimodal" = c(
    rnorm(population_size, mean = 0, sd = 5),
    rnorm(population_size, mean = 20, sd = 5)
  ),
  "Binomial" = rbinom(population_size, size = 20, prob = 0.5),
  "Chi-Square" = rchisq(population_size, df = 70),
  "F" = rf(population_size, df1 = 30, df2 = 20),
  "Logistic" = rlogis(population_size, location = 0, scale = 1),
  "Normal Distribution (Gaussian)" = rnorm(population_size, mean = 0, sd = 1),
  "Poisson" = rpois(population_size, lambda = 4),
  "Student t" = rt(population_size, df = 30),
  "Uniform" = runif(population_size, min = 0, max = 100)
)

distributions_list = lapply(distributions_df, as.numeric) ## converting df to list 

## returns a vector of sample means sampled from a given population distribution
sampling_distribution <- function(pop_dist, number_of_samples, sample_size) {
  sample_mean <- c()
  for (i in 1:number_of_samples) { 
    sample_mean[i] = mean(sample(pop_dist, size=sample_size, replace = T))
  }
  return(sample_mean)
}

## x/y lim = c(??, ??)
create_histograms <- function(dist_type, pop_dist, sample_mean) {
  hist(pop_dist, main=paste(dist_type, "Population Distribution"),
       xlab="Frequency", col="DarkCyan", labels=T)
  hist(sample_mean, main=paste(dist_type, "Sampling Distribution"),
       xlab="Frequency", col="DarkGreen", labels=T)
}

input_to_hist <- function(dist_list, dist_type, number_of_samples, sample_size) {
  create_histograms(
      dist_type,
      unlist(dist_list[dist_type]),
      sampling_distribution(unlist(dist_list[dist_type]), number_of_samples, sample_size)
    )
  }

input_to_hist(distributions_list, "F", 1000, 100)


## left 2 do
#### distribution names
#### personalizing histograms: see create_histograms()