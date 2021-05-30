data {
    real psi;
}

parameters {
    real B;
    real<lower=0.001> s;
}

model {
    B ~ normal(0,s);
    s ~ exponential(psi);
}
