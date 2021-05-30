data {
    int<lower=1> N; // number of data points; lower = 1 means to constrain N > 0
    real X[N];      // X[i] = gene expression for individual i
}

parameters {
    real <lower=0, upper=1> r; // mixture proportion
    real mu;                   // mu = mean of individuals w/ decreased expression
    real<lower=0.001> sigma;   // sigma = variance of expression > 0
}

model {
    r ~ beta(2,2);
    mu ~ normal(0,10);
    sigma ~ inv_gamma(1,1);
    for (i in 1:N) 
        target += log_sum_exp(
            log(r)   + normal_lpdf(X[i] | mu, sigma),
            log(1-r) + normal_lpdf(X[i] |  0, sigma));
}
