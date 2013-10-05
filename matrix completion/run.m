clear
clc
Xtrain = rand(1000, 1000);
Ytrain = rand(1000, 20);
Xtest = rand(500, 1000);
Ytest = zeros(500, 20);
Z1 = MC_1(Xtrain, Ytrain, Xtest, Ytest);
rank(Z1)
out = MC_b(Xtrain, Ytrain, Xtest, Ytest);
Zb = out.Z;
rank(Zb)