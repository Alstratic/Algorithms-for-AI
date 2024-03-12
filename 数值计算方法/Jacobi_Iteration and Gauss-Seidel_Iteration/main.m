clc;clear;
A=input("请输入系数方阵A:");
b=input("请输入常数向量b:");

x_start=input("请输入迭代初始向量x:");
n_limit=1000;
tolerance=10^(-5);
[solution3,n1]=Jacobi(A,b,x_start,n_limit,tolerance);
fprintf('使用Jacobi迭代的方程组的解为: %s，迭代次数为: %d\n', mat2str(solution3), n1);

[solution4,n2]=gauss_seidel(A,b,x_start,n_limit,tolerance);
fprintf('使用Gauss-Seidel迭代的方程组的解为: %s，迭代次数为: %d\n', mat2str(solution4), n2);

