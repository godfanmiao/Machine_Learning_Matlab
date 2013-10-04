% MC-1 by Miao Fan 
% Tsinghua University
% fanmiao.cslt.thu@gmail.com

function Z = MC_1(Xtrain, Ytrain, Xtest, Ytest)

    [numOfXtrain, demXtrain] = size(Xtrain);
    [numOfYtrain, demYtrain] = size(Ytrain);

    B = zeros(1, demYtrain);

    X = [Xtrain; Xtest];
    [x, y] = find(X > 0);
    OmigaX = [x, y];
    [r, c] = size(OmigaX);
    numOfOmigaX = r;

    Y = [Ytrain; zeros(size(Ytest))];
    [x, y] = find(Y > 0);
    OmigaY = [x, y];
    [r, c] = size(OmigaY);
    numOfOmigaY = r;
    
    Z = [X, Y];
    [r, c] = size(Z);
    Z = [ones(r, 1), Z];
    
    params = getParams();
    muf = params.mu;

    for i = 1 : params.maxitr
        Zp = Z;
        gz = getGZ(params.lamda, numOfOmigaY, numOfOmigaX, OmigaY, OmigaX, Y, X, Z, B);
        A = Z - params.tauz * gz;

        [U, S, V] = svd(A);

        S = max(0,S-params.tauz * muf);
        Z = U * S * V';
        Z(:, 1) = ones(r, 1);
        if (norm(Zp-Z, 'fro') <= params.tol)
            return;
        end
    end
end

    %
    % inner gradient function for Z(MC_1)
    %

function gz = getGZ(lamda, numOfOmigaY, numOfOmigaX, OmigaY, OmigaX, Y, X, Z, B)

    [rowZ, columnZ] = size(Z);
    [rowX, columnX] = size(X);

    gz = zeros(rowZ, columnZ);

    for k = 1 : numOfOmigaY
        i = OmigaY(k, 1);
        j = OmigaY(k, 2);
        gz(i, j + columnX + 1) = lamda / numOfOmigaY * (-Y(i, j) / (1 + exp(Y(i, j) * (Z(i, j + columnX + 1) + B(1, j)))));        
    end

    for k = 1 : numOfOmigaX      
        i = OmigaX(k, 1);
        j = OmigaX(k, 2);
        gz(i, j + 1) = 1.0 / numOfOmigaX * (Z(i, j + 1) - X(i, j));
    end
end



