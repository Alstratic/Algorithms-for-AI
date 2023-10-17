import matplotlib.pyplot as plt
import math
from mpl_toolkits.mplot3d import Axes3D


def f1(x, y):
    value = x ** 2 + 100 * y ** 2
    return value


# f1对x的偏导数
def df1(x):
    return 2 * x


# f1对y的偏导数
def df2(y):
    return 200 * y


# 偏导数的norm
def norm_df1(x, y):
    return math.sqrt(df1(x)**2+df2(y)**2)


x = 100
y = 100

alpha = 0.005
norm=[norm_df1(x,y)]

x_list=[x]
y_list=[y]
epsilon = 1e-5
iter_num = 0

while iter_num < 10000:
    x = x - alpha * df1(x)
    y = y - alpha * df2(y)

    tmp_norm = norm_df1(x, y)
    x_list.append(x)
    y_list.append(y)
    norm.append(tmp_norm)
    print(f"第{iter_num}次迭代，||∇f(x_k)||为{tmp_norm},x为{x},y为{y}")
    if  tmp_norm<=epsilon:
        print(f"经过了{iter_num}次迭代，最终||∇f(x_k)||为{tmp_norm},x为{x},y为{y}")
        break
    iter_num += 1

fig = plt.figure(facecolor='w',figsize=(20,18))
ax = Axes3D(fig)
ax.plot(x_list[::20],y_list[::20],norm[::20],'ko-')
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')
# plt.savefig('svg')
plt.show()