import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# 初始化
x0 = np.array([100.0, 100.0])  # 初始点
A = np.array([[1, 0], [0, 100]])  # A 矩阵
b = np.array([0, 0])  # b 向量
epsilon = 1e-5  # 收敛阈值
max_iterations = 1000  # 最大迭代次数

x = x0
iter = 0
x_list=[x[0]]
y_list=[x[1]]
# 计算梯度
grad = 2 * (A @ x + b)
gradient_norms =[np.linalg.norm(grad)]

while np.linalg.norm(grad) > epsilon:
    iter += 1

    # 计算步长
    t = np.linalg.norm(grad)**2 / (2 * grad @ (A @ grad))

    # 更新 x
    x = x - t * grad
    x_list.append(x[0])
    y_list.append(x[1])
    gradient_norms.append(np.linalg.norm(grad))

    # 重新计算梯度
    grad = 2 * (A @ x + b)

    # 计算目标函数值
    fun_val = x @ (A @ x) + 2 * b @ x

    # 打印信息
    print(f'第{iter}次迭代, 梯度norm值为{np.linalg.norm(grad):.6f}, fun_val = {fun_val:.6f},x的值为{x},')
print(f"x_list={x_list}\n,y_list={y_list}\n,gradient_norms={gradient_norms}")

fig = plt.figure(facecolor='w',figsize=(20,18))
ax = Axes3D(fig)
ax.plot(x_list,y_list,gradient_norms,'ko-')
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')

plt.show()