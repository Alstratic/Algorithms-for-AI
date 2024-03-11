最优化所用书籍借鉴了**Amir Beck - Introduction to nonlinear optimization_ theory, algorithms, and applications with MATLAB**

这本教材内容由浅入深、语言通俗易懂，对于初学者而言较为合适。美中不足的是，国外原版教材对于英文不好的同学而言或许不太友好，但是毕竟鱼与熊掌不可兼得，要学习更加前沿的知识，往往脱离不开广泛阅读国外优秀著作，英语能力与水准也对之后的学习大有裨益。

国内著作可以参考《凸优化》

本文件目录下有着笔者实现最优化算法所用代码与作业报告，如下所示：

- Gradient Decent 包含了三种基础的梯度下降算法，以及一个基于正则化最小二乘法(RLS)实现的信号去噪的案例
  - Consant Stepsize
  - Exact Line Search
  - Backtracking
  - Signal Denosing based on RLS

- Subgradient Decent and Proximal Decent for LASSO problem 包含了迫近梯度和近邻梯度求解Lasso问题的方法

- Pegasos and Subsgradient for SVM 包含了使用Pegasos$^{[1]}$和次梯度法求解SVM问题的方法
  - ${[1]}$Shalev-Shwartz S, Singer Y, Srebro N. Pegasos: Primal estimated sub-gradient solver for svm[C]//Proceedings of the 24th international conference on Machine learning. 2007: 807-814.

笔者才疏学浅，仅作抛砖引玉之效，如有缺漏请不吝赐教，笔者感激不尽。
