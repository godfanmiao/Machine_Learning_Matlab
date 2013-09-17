%--------------------------------------------------------------------------
% Fixed Point Continuation Methods based on Approximate SVD (FPCA) for Matrix
% Completion Problem. 
%
% Solves
%           min  rank(X)
%           s.t. X_ij = M_ij , (i,j) \in \Omega
%
% This file gives examples how to use FPCA to solve matrix completion
% problems.
% 
% Reference: "Fixed point and Bregman iterative methods for matrix
%             rank minimization." 
%             Shiqian Ma, Donald Goldfarb, Lifeng Chen, 
%             Technical Report, Columbia University, October 2008
% Available at: 
%             http://www.optimization-online.org/DB_HTML/2008/11/2151.html
%             ftp://ftp.math.ucla.edu/pub/camreport/cam08-78.pdf
% 
% Author: Shiqian Ma 
% Copyright (C) 2008 Shiqian Ma, Columbia University 
% Date: May,15,2008. (Last Modified: July, 06, 2008)
%--------------------------------------------------------------------------
clear all; clc;

% prepare data
% X is m by n matrix, sr is the sampling ratio, p is the number of samples,
% r is the rank of the matrix M to be completed.

m = 40; n = 40; sr = 0.5; p = round(m*n*sr); r = 3; 
% m = 100; n = m; sr = 0.3; p = round(m*n*sr); r = 2;
% m = 100; n = m ; p = 5666; sr = p/m/n; r = 10;
% m = 200; n = m; p = 15665; sr = p/m/n; r = 10;
% m = 500; n = m; p = 49471; sr = p/m/n; r = 10;
% m = 150; n = 300; sr = 0.49; p = round(m*n*sr); r = 10;

% fr is the freedom of set of rank-r matrix, maxr is the maximum rank one
% can recover with p samples, which is the max rank to keep fr < 1
fr = r*(m+n-r)/p; maxr = floor(((m+n)-sqrt((m+n)^2-4*p))/2);

rs = randseed; randn('state',rs); rand('state',rs);

% get problem
A = randperm(m*n); A = A(1:p); % A gives the position of samplings
xl = randn(m,r); xr = randn(n,r); xs = xl*xr'; % xs is the matrix to be completed
b = reshape(xs,m*n,1); b = b(A); % b is the samples from xs

% get parameters for FPCA . 
opts = get_opts_FPCA(xs,maxr,m,n,sr,fr); 

% call FPCA to solve the matrix completion problem
fprintf('solving by FPCA....\n');
solve_fpc = cputime;
Out = FPCA_MatComp(m,n,A,b,opts);
solve_fpc = cputime - solve_fpc; Out.solve_t = solve_fpc;
fprintf('done!\n');
% print the statistics
fprintf('m = %d, n = %d, r = %d, p = %d, samp.ratio = %3.2f, freedom = %3.2f, randseed = %d\n',m,n,r,p,sr,fr,rs);
fprintf('Time = %3.2f, relative error = %3.2e\n', solve_fpc, norm(Out.x-xs,'fro')/norm(xs,'fro'));
