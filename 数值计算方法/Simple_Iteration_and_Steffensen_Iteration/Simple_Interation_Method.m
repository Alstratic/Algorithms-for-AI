function result = Simple_Interation_Method(phi, initial_guess, tolerance, max_iterations)
    % 初始化x_0
    x = initial_guess;
    % 迭代次数，初始为1
    iteration = 1;

    while iteration <= max_iterations
        % 使用迭代函数得到新的值
        x_new = phi(x);
        % 计算当前迭代的误差
        error = abs(x_new - x);
        % 输出当前迭代的结果
        fprintf('第 %d 次迭代：x = %f\n', iteration, x_new);
        
        % 如果误差小于阈值，达到所需精度
        if error < tolerance
            fprintf('在 %d 次迭代后达到所需的精度 (%e)。\n', iteration, tolerance);
            result = x_new;
            return;
        end

        % 更新当前值
        x = x_new;
        % 增加迭代次数
        iteration = iteration + 1;
    end

    % 输出在最大迭代次数内未收敛的消息
    disp('在最大迭代次数内未收敛。');
    result = [];
end