function [X_reality, n_reality] = gauss_seidel(A, b, X_start, n_limit, tolerance)
    % A为迭代的系数矩阵
    % b为方程组右边的常数项（列向量）
    % X_start为迭代的初始向量
    % n_limit为最大允许迭代的次数
    % tolerance为精度上限值
    % X_reality为最后结果
    % n_reality为最后迭代次数

    [n, n] = size(A); % A的行数和列数均为n
    D = diag(diag(A)); % D的对角线元素根A的对角线元素相同，其余为0
    L=tril(A);
    U=triu(A);
    disp(U);

    B = inv(D-L) * U; % B为雅克比迭代矩阵，也就是化简后的便于迭代的等价方程组的系数矩阵
    f = inv(D-L) * b; % f为化简后的便于迭代的等价方程组的常数项向量
    n_reality = 0;
    
    while 1
        if(n_reality > n_limit)
            disp('迭代次数超界');
            break;
        end
        X_reality = B * X_start + f; % 雅可比迭代公式
        n_reality = n_reality + 1;
        if(norm(X_reality - X_start) <= tolerance) % 如果满足条件||X(k+1) - X(k)||的2范数小于等于tolerance
            break; % 则退出函数
        else
            X_start = X_reality; % 循环迭代
        end
    end
end