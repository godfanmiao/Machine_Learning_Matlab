clc
clear

load('fisheriris.mat');
trainRange = [1:1:33] ;
trainRange = [trainRange, [51 : 1 : 51 + 32]];
trainRange = [trainRange, [101: 1 : 101 + 32]];
testRange = [34 : 1 : 50];
testRange = [testRange, [84 : 1 : 100]];
testRange = [testRange, [134 : 1 : 150]];

sp = nominal(species);
sp = double(sp);

Xtrain = meas(trainRange, :);

Ytrain = sp(trainRange, :);

Xtest = meas(testRange, :);

Ytest = sp(testRange, :);
paramMatrix = mnrfit(Xtrain, Ytrain);

Xtest = [ones(size(Xtest), 1), Xtest];

Yprob = Xtest * paramMatrix;

predictValue = 0;
prec = 0;
Ypredict = [];
[testNum, labelNum] = size(Yprob);
labelNum = labelNum + 1;

for i = 1 : size(Ytest)
    [maxValue, maxIndex] = max(Yprob(i, :));
    if maxValue < 0
        Ypredict(i, :) = labelNum;
    else
        Ypredict(i, :) = maxIndex;
    end
    
    if Ypredict(i, :) == Ytest(i, :)
        prec = prec + 1;
    end       
end

double(prec) / testNum







