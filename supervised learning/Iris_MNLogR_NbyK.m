clc
clear
clf

[x1, x2, x3, x4, y] = textread('../dataset/labeled dataset/iris.data', '%f,%f,%f,%f,%s');
X = [x1, x2, x3, x4];
Y = double(nominal(y));

maxLabel = max(Y);
[row, column] = size(Y);
newY = zeros(row, maxLabel);

for i = 1 : row
    newY(i, Y(i,:)) = 1;
end

Y = newY;

trainRange = [[1 : 33], [51 : 83], [101 : 133]];
testRange = [[34 : 50], [84 : 100], [134 : 150]];

trainX = X(trainRange, :);
trainY = Y(trainRange, :);

testX = X(testRange, :);
testY = Y(testRange, :);

paramMatrix = mnrfit(trainX, trainY);

[testRow, testColumn] = size(testY);

testX = [ones(testRow, 1), testX];

probY = testX * paramMatrix;

correctCount = 0;

for i = 1 : testRow
    [maxValue, maxIndex] = max(probY(i, :));
    
    if(maxValue < 0)
        if (testY(i, testColumn) == 1)
            correctCount = correctCount + 1; 
        end
    else
        if(testY(i, maxIndex) == 1)
            correctCount = correctCount + 1;
        end
    end
end

fprintf('%s\n%s: %.3f\n','Iris dataset with Multinomal Logistic Regression.', 'Precision', double(correctCount) / testRow)

