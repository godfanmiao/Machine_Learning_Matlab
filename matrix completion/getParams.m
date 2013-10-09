function params = getParams(Z, numOfOmigaY, numOfOmigaX)

[n, m] = size(Z);

[U, S, V] = svd(Z);

% final mu 
params.muf = 1e-2;

% relative coverge tolerance
params.tol = 1e-1;

% decay parameter for mu
params.eta = 0.01;

% max outer iteration
params.maxOuterItr = 500;

% max inner iteration
params.maxInnerItr = 100;

params.mus = S(1) * params.eta;

% tradeoff parameter
params.lamda = 0.5;
% step size of matrix Z

% less than min(4 * numOfOmigaY / lamda, numOfOmigaX);
% params.tauz = min(4 * numOfOmigaY / params.lamda, numOfOmigaX) / 2;
params.tauz = 0.5;

% step size of bias vector b;
% less than 4 * numOfOmigaY / (lamda * n);
% params.taub = 4 * numOfOmigaY / (params.lamda * n) / 2;
params.taub = 0.5;


end