import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
# 初始优化变量 x0
x0 = np.array([100.0, 100.0])   # 初始值
A = np.array([[1, 0], [0, 100]])  # A 矩阵

# 定义目标函数 f(x)和梯度函数 g(x)
def f(x):
    return x @ (A @ x)

def g(x):
    return 2 * (A @ x)

# 初始化参数
X = x0
grad = g(x0)
print(grad)
fun_val = f(x0)
iter = 0
epsilon = 1e-5
alpha = 0.5
beta = 0.5
s = 1.0     #初始步长
x_list=[X[0]]
y_list=[X[1]]
gradient_norms =[np.linalg.norm(grad)]
gradient_norm=np.linalg.norm(grad)

# 迭代优化过程
while np.linalg.norm(grad) > epsilon:
    iter += 1
    t = s
    while fun_val - f(X - t * grad) < alpha * t * np.linalg.norm(grad)**2:
        t = beta * t
    X = X - t * grad
    fun_val = f(X)
    grad = g(X)
    x_list.append(X[0])
    y_list.append(X[1])
    gradient_norms.append(np.linalg.norm(grad))
    print(f'迭代次数是{iter:3d},梯度范数是{np.linalg.norm(grad):8.6f},函数值是{fun_val:8.6f}')



print(f"在第{iter}次迭代后收敛,此时梯度范数是{np.linalg.norm(grad)}")

fig = plt.figure(facecolor='w',figsize=(20,18))
ax = Axes3D(fig)
ax.plot(x_list[::7],y_list[::7],gradient_norms[::7],'ko-')
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')

plt.show()