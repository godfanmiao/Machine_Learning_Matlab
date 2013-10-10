%--------------------
% Matrix Completion
%--------------------
clear
clc
Z0 = load('../Dataset/labeled dataset/semeion.data');
Xtrain = Z0(1:1000, 1:256);
Ytrain = Z0(1:1000, 257:266);
Xtest = Z0(1001:1593, 1:256);
Ytest = Z0(1001:1593, 257:266);

% Zb = MC_b(Xtrain, Ytrain, Xtest, zeros(593, 10));
% YPredict = Zb(1001:1593, 257:266);

Z1 = MC_1(Xtrain, Ytrain, Xtest, zeros(593, 10));
rank(Z1)
YPredict = Z1(1001:1593, 258:267);

[m, n] = size(Ytest);

count = 0;
for i = 1 : m
    [value, index] = max(YPredict(i, :));
    if(Ytest(i, index) == 1)
        count = count + 1;
    end
end

count * 1.0 / m


%------------------
% KNN Classifier
%------------------
% clear
% clc
% Z0 = load('../Dataset/labeled dataset/semeion.data');
% Xtrain = Z0(1:500, 1:256);
% Ytrain = Z0(1:500, 257:266);
% 
% [r, c] = size(Ytrain);
% YtrainNew = zeros(r, 1);
% for i = 1 : r
%     [value, index] = max(Ytrain(i, :));
%     YtrainNew(i, :) = index;
% end
% 
% 
% Xtest = Z0(501:1593, 1:256);
% Ytest = Z0(501:1593, 257:266);
% [r, c] = size(Ytest);
% for i = 1 : r
%     [value, index] = max(Ytest(i, :));
%     YtestNew(i, :) = index;
% end
% 
% mdl = ClassificationKNN.fit(Xtrain, YtrainNew);
% Ypredict = predict(mdl, Xtest);
% 
% count = 0;
% for i = 1 : r
%     if (Ypredict(i, :) == YtestNew(i, :))
%         count = count + 1;
%     end
% end
% 
% count / r;