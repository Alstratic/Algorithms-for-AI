function x = gaussian_elimination(A, b)
    n = length(b);
    % 消元过程
    for k = 1:n-1
        for i = k+1:n
            if A(k,k) == 0
                error('主对角元素错误！');
            else
                L_ik = A(i,k) / A(k,k);
                for j = k+1:n
                    A(i,j) = A(i,j) - L_ik * A(k,j);
                end
                b(i) = b(i) - b(k) * L_ik;
            end
        end
    end

    % 回代过程
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = b(i);
        for j = i+1:n
            x(i) = x(i) - A(i,j) * x(j);
        end
        x(i) = x(i) / A(i,i);
    end
end