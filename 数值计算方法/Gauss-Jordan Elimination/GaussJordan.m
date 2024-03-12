function x = GaussJordan(A, b)
    matrix = [A, b];
    n = length(matrix(:, end));
    for i = 1 : n
        % 找第i列最大值
        [max_col, position_to_i] = max(matrix(i:end, i));
        if max_col == 0
            error('主对角元是0，无唯一解，无法用高斯主列消元法解');
        end
        % 交换最大元列的行
        max_col_rowposition = position_to_i + i - 1;
        if max_col_rowposition ~= i
            temp = matrix(i, :);
            matrix(i, :) = matrix(max_col_rowposition, :);
            matrix(max_col_rowposition, :) = temp;
        end
        % 主对角元化1
        matrix(i, :) = matrix(i, :) / matrix(i, i);
        % i+1行后全部行消元
        for j = (i + 1) : n
            scale = matrix(j, i) / matrix(i, i);
            matrix(j, :) = matrix(j, :) - scale * matrix(i, :);
        end
    end
    % 后替换法
    for i = n : -1 : 1
        for j = 1 : i - 1
            matrix(j, :) = matrix(j, :) - matrix(j, i) * matrix(i, :);
        end
    end
    x = matrix(:, end);
end