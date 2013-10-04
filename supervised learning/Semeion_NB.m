clc
clear
clf

dataMatrix = load('../dataset/labeled dataset/semeion.data');

X = dataMatrix(:, [1:256]);
Y = dataMatrix(:, [257:266]);
Y = matrixVectorization(Y);
trainRange = [1: 1195];
testRange = [1196:1593];

trainX = X(trainRange, :);
trainY = Y(trainRange, :);

testX = X(testRange, :);
testY = Y(testRange, :);

mdl = NaiveBayes.fit(trainX, trainY);

predictY = mdl.predict(testX);

[testRow, testColumn] = size(testY);

correctCount = 0;

for i = 1 : testRow
    if (predictY(i, :) == testY(i, :))
        correctCount = correctCount + 1;
    end
end

fprintf('%s\n%s: %.3f\n','Semieon dataset with NB.', 'Precision', double(correctCount) / testRow)