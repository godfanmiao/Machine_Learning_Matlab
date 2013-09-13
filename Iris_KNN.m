clc
clear
clf

[x1, x2, x3, x4, y] = textread('dataset/iris.data', '%f,%f,%f,%f,%s');
X = [x1, x2, x3, x4];
Y = double(nominal(y));

trainRange = [[1:33], [51:83], [101:133]];
testRange = [[34:50], [84:100], [134:150]];

trainX = X(trainRange, :);
trainY = Y(trainRange, :);

testX = X(testRange, :);
testY = Y(testRange, :);

mdl = ClassificationKNN.fit(trainX, trainY);

predictY = mdl.predict(testX);

[testRow, testColumn] = size(testY);

correctCount = 0;

for i = 1 : testRow
    if predictY(i, :) == testY(i, :)
        correctCount = correctCount + 1;
    end
end


sprintf('%s\n%s: %.3f','Iris dataset with KNN.', 'Precision', double(correctCount) / testRow)
