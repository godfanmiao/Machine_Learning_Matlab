dataMatrix = load('../dataset/labeled dataset/semeion.data');

X = dataMatrix(:, [1:256]);
Y = dataMatrix(:, [257:266]);
trainRange = [1: 1195];
testRange = [1196:1593];

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

sprintf('%s\n%s: %.3f','Semieon dataset with Multinomal Logistic Regression.', 'Precision', double(correctCount) / testRow)


