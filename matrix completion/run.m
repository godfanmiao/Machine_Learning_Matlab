clear
clc
Xtrain = rand(6000, 1500);
Ytrain = rand(6000, 100);
Xtest = rand(1000, 1500);
Ytest = zeros(1000, 100);
% Z1 = MC_1(Xtrain, Ytrain, Xtest, Ytest);
% rank(Z1)
Z = [Xtrain, Ytrain; Xtest, Ytest];
preRank_b = rank(Z)
Zb = MC_b(Xtrain, Ytrain, Xtest, Ytest);
postRank_b = rank(Zb)

preRank_1 = rank(Z)
Z1 = MC_1(Xtrain, Ytrain, Xtest, Ytest);
postRank_1 = rank(Z1)


