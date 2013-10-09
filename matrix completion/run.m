clear
clc
% Xtrain = rand(1000, 1000);
% Ytrain = rand(1000, 20);
% Xtest = rand(500, 1000);
% Ytest = zeros(500, 20);
% Z = [Xtrain, Ytrain; Xtest, Ytest];

N1 = 300; N2 = 60;
M1 = 100; M2 = 20;
R = 22;
A = rand(N1+N2, R);
B = rand(R, M1+M2);
Z = A * B;
Xtrain = Z(1:N1, 1:M1);
Ytrain = Z(1:N1, M1+1:M1+M2);
Xtest = Z(N1+1:N1+N2, 1:M1);
% Ytest = Z(N1+1:N1+N2, M1+1:M1+M2);
Ytest = zeros(N2, M2);
Z = [Xtrain, Ytrain; Xtest, Ytest];

preRank_b = rank(Z)
Zb = MC_b(Xtrain, Ytrain, Xtest, Ytest);
postRank_b = rank(Zb)

preRank_1 = rank(Z)
Z1 = MC_1(Xtrain, Ytrain, Xtest, Ytest);
postRank_1 = rank(Z1)


