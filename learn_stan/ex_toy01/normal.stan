data {
    int<lower=1> N;
    real X[N];
}

parameters {
    real mu;
    real<lower=0.001> sigma;
}

model {
    mu ~ normal(0,10);
    sigma ~ inv_gamma(1,1);
    for (i in 1:N) X[i] ~ normal(mu, sigma);
}
