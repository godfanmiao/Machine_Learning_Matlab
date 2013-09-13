clc
clear
clf

[x1, x2, x3, x4, y] = textread('../dataset/labeled dataset/iris.data', '%f,%f,%f,%f,%s');
X = [x1, x2, x3, x4];
Y = double(nominal(y));

trainRange = [[1:33], [51:83], [101:133]];
testRange = [[34:50], [84:100], [134:150]];

trainX = X(trainRange, :);
trainY = Y(trainRange, :);

testX = X(testRange, :);
testY = Y(testRange, :);
maxLabel = max(testY);
paramMatrix = mnrfit(trainX, trainY);

[testRow, testColumn] = size(testX);

testX = [ones(testRow, 1), testX];
probY = testX * paramMatrix;

correctCount = 0;

for i = 1 : testRow
    [maxValue, maxIndex] = max(probY(i, :));
    if (maxValue < 0)
        if (testY(i, :) == maxLabel)
            correctCount = correctCount + 1;
        end
    else
        if (maxIndex == testY(i, :))
            correctCount = correctCount + 1;
        end
        
    end
end


sprintf('%s\n%s: %.3f','Iris dataset with Multinomal Logistic Regression.', 'Precision', double(correctCount) / testRow)

    










