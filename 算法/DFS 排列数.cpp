#include<bits/stdc++.h>
using namespace std;
const int N=10;	//最大数据是10 不过题目里是7 
int path[N];	//用来保存一条路径(一组答案) 
bool state[N];	//判断当前数字是否在当前路径中已经出现 

//dfs就是一棵树，树的层数是n+1(根节点是0)
 
void dfs(int u,int n)
{
	if(u==n)//如果已经到达叶子结点，输出 
	{
		for(int i=0;i<n;i++)	cout<<path[i]<<" ";
		cout<<endl;
	}
	
	for(int i=1;i<=n;i++)//没有到达叶子节点，就在当前没出现的数字中寻找合适的数字 
		if(!state[i])
		{
			path[u]=i;
			state[i]=true;//将当前数字状态置为true,这个答案后续都不能选这个数字 
			dfs(u+1,n);//递归 
			state[i]=false;//回溯后要置false 
		}
}

int main()
{
	int n;
	cin>>n;
	
	dfs(0,n);
}
