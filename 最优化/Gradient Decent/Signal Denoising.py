import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = ['SimHei']  # 使用中文黑体
plt.rcParams['axes.unicode_minus'] = False  # 用于正常显示负号

def draw_origin_pic(x,b):
    color_prism = plt.cm.prism
    plt.plot(range(1, 301), b, linewidth=1, label='施加噪声曲线', color=color_prism(0))
    plt.plot(range(1, 301), x, linewidth=0.7, label='未施加噪声曲线', color='b')
    plt.xlim([0, 300])
    plt.ylim([-0.5, 3.5])
    plt.legend(loc='upper left')
    plt.title('施加噪声前后图像对比')
    plt.show()

def draw_single_pic(x, b, optimum, lambda_val, pic_title):
    sse = np.linalg.norm(optimum - x) ** 2
    plt.plot(range(1, 301), x, linewidth=1, label='未施加噪声曲线', color='b')
    plt.plot(range(1, 301), optimum, linewidth=1.2,
             label=f'正则化项λ={lambda_val}的曲线,误差SSE={sse}',
             color='red')
    plt.gca().get_lines()[-1].set_alpha(0.5)

    plt.xlim([0, 300])
    plt.ylim([-0.5, 3.5])
    plt.legend(loc='upper left')
    plt.title(pic_title)

def draw_multiple_pics(x, b, lambdas):
    for l in lambdas:
        # 创建 L 矩阵
        L = np.zeros((299, 300))
        for i in range(299):
            L[i, i] = 1
            L[i, i + 1] = -1

        # 计算 RLS 解
        A = np.eye(300) + l * np.dot(L.T, L)
        x_rls_solution = np.linalg.solve(A, b)

        # 绘制单个图
        pic_title = f'RLS solution (λ={l})'
        draw_single_pic(x, b, x_rls_solution, l, pic_title)
        plt.show()

# 模拟数据
x = np.sin(np.linspace(0, 4, 300))
b = x + 0.05 * np.random.randn(300)

# 定义正则化参数 lambda 列表
lambdas = [1, 10, 100,1000]

# 绘制多个正则化项的图
draw_origin_pic(x,b)
draw_multiple_pics(x, b, lambdas)
