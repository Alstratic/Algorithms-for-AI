clc;clear;
initial_guess =10;
tolerance = 0.5 * 1e-5;
max_iterations = 1000;

disp(['使用简单迭代法对函数 x=(3x+1)^(1/5) 进行迭代']);
result1 = Simple_Interation_Method(@phi1_function, initial_guess, tolerance, max_iterations);
disp(['近似解为: ', num2str(result1)]);

disp(['使用Steffensen加速迭代法对函数 x=(3x+1)^(1/5) 进行迭代']);
result2 = steffensen_iteration(@phi1_function, initial_guess, tolerance, max_iterations);
disp(['近似解为: ', num2str(result2)]);

disp(['使用简单迭代法对函数 x=(1/2)sin(x) 进行迭代']);
result3 = Simple_Interation_Method(@phi2_function, initial_guess, tolerance, max_iterations);
disp(['近似解为: ', num2str(result3)]);

disp(['使用Steffensen加速迭代法对函数 x=(1/2)sin(x) 进行迭代']);
result4 = steffensen_iteration(@phi2_function, initial_guess, tolerance, max_iterations);
disp(['近似解为: ', num2str(result4)]);