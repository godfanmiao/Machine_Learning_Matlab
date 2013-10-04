function params = getParams()

% step size of matrix Z
params.tauz = 0.5;

% step size of bias vector b
params.taub = 0.5;

% for each u1, u2, u...
params.mu = 0.5;

% coverge tolerance
params.tol = 3.0;

% decay parameter for mu
params.eta = 0.25;

% tradeoff parameter
params.lamda = 0.5;

% max iteration
params.maxitr = 100;

end