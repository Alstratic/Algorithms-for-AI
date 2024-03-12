clc;clear;
% Example
A=input("请输入系数方阵A:");
b=input("请输入常数向量b:");

solution1 = gaussian_elimination(A, b);
solution2=GaussJordan(A,b);
disp('使用Gauss消元法的方程组的解为:');
disp(solution1);
disp('使用Gauss-Jordan消元法的方程组的解为:');
disp(solution2);