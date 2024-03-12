function [X_reality, n_reality, norms] = gauss_seidel(A, b, X_start, n_limit, tolerance)
    % A：系数矩阵，b：常数向量，X_start：初始解向量
    % n_limit：最大迭代次数，tolerance：精度上限值
    % X_reality：最后结果，n_reality：最后迭代次数，norms：每次迭代后的范数记录

    n = length(b); % 未知数个数
    X_reality = X_start; % 初始化解向量
    n_reality = 0; % 初始化迭代次数
    norms = []; % 初始化范数记录
    
    while 1
        if(n_reality > n_limit)
            disp('迭代次数超界');
            break;
        end
        X_old = X_reality; % 保存旧的解向量
        for i = 1:n
            X_reality(i) = (b(i) - A(i,1:i-1)*X_reality(1:i-1) - A(i,i+1:n)*X_reality(i+1:n)) / A(i,i);
        end
        disp(['第', num2str(n_reality), '次迭代,解为：', mat2str(X_reality)]);

        n_reality = n_reality + 1; % 迭代次数加1
        norm_value = norm(X_reality - X_old);
        norms = [norms, norm_value]; % 记录范数
        if(norm_value <= tolerance) % 如果满足条件||X(k+1) - X(k)||的2范数小于等于tolerance
            break; % 则退出函数
        end
    end

    % 绘制范数随迭代次数的图像
    figure;
    plot(1:n_reality, norms, '-o');
    xlabel('迭代次数');
    ylabel('误差');
    title('Gauss-Seidel迭代法随迭代次数变化');
end
