data {
    int<lower=1> N; // number of data points
    real X[N];              
    real Y[N];
    real psi;       // shrinkage parameter
}
parameters {
    real B;                  // regression coefficient
    real alpha;              // intercept
    real<lower=0.001> sigma; // sd of Y|X
    real<lower=0.001> s;     // used in prior on B
}
model {
    alpha ~ normal(0,10);
    B ~ normal(0,s);
    s ~ exponential(psi);
    sigma^2 ~ inv_gamma(1,30);
    target += log(2) + log(sigma); // log of Jacobian
    for(i in 1:N) Y[i] ~ normal(X[i]*B+alpha,sigma);
}

