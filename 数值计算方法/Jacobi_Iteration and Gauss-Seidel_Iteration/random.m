

clc;clear;
% 生成一个10x10的随机矩阵 A，确保其谱半径小于1
spectral_radius = 0.1; % 你可以调整这个值
A = 10*rand(5, 5);

% 生成一个10维的随机向量作为常数向量 b
b = 10*rand(5, 1);

% 显示生成的系数矩阵 A 和常数向量 b
disp('A =');
disp(A);
disp('b =');
disp(b);

x_start=input("请输入迭代初始向量x:");

n_limit=1000;
tolerance=10^(-5);

[solution3,n1]=Jacobi(A,b,x_start,n_limit,tolerance);
fprintf('使用Jacobi迭代的方程组的解为: %s，迭代次数为: %d\n', mat2str(solution3), n1);

[solution4,n2]=gauss_seidel(A,b,x_start,n_limit,tolerance);
fprintf('使用Gauss-Seidel迭代的方程组的解为: %s，迭代次数为: %d\n', mat2str(solution4), n2);