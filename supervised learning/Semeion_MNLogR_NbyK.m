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


