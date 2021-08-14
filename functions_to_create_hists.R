## 08.14.21
## Piers Kirk, pfk3jd

set.seed(1)
population_size = 100000

## returns a vector of sample means sampled from a given population distribution
sampling_distribution <- function(pop_dist, number_of_samples, sample_size) {
  sample_mean <- c()
  for (i in 1:number_of_samples) {
    sample_mean[i] = mean(sample(pop_dist, size=sample_size, replace = T))
  }
  return(sample_mean)
}
