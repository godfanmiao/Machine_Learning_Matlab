function [ vector ] = matrixVectorization(matrix)
%matrixVectorization Summary of this function goes here
%   Detailed explanation goes here
    [row, column] = size(matrix);
    vector = zeros(row, 1);
    
    for i = 1 : row
        for j = 1 : column
            if(matrix(i, j) == 1)
                vector(i, :) = j;
        end
    end
    
end

