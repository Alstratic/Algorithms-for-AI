#include<bits/stdc++.h>
using namespace std;
const int N=10;	//���������10 ������Ŀ����7 
int path[N];	//��������һ��·��(һ���) 
bool state[N];	//�жϵ�ǰ�����Ƿ��ڵ�ǰ·�����Ѿ����� 

//dfs����һ���������Ĳ�����n+1(���ڵ���0)
 
void dfs(int u,int n)
{
	if(u==n)//����Ѿ�����Ҷ�ӽ�㣬��� 
	{
		for(int i=0;i<n;i++)	cout<<path[i]<<" ";
		cout<<endl;
	}
	
	for(int i=1;i<=n;i++)//û�е���Ҷ�ӽڵ㣬���ڵ�ǰû���ֵ�������Ѱ�Һ��ʵ����� 
		if(!state[i])
		{
			path[u]=i;
			state[i]=true;//����ǰ����״̬��Ϊtrue,����𰸺���������ѡ������� 
			dfs(u+1,n);//�ݹ� 
			state[i]=false;//���ݺ�Ҫ��false 
		}
}

int main()
{
	int n;
	cin>>n;
	
	dfs(0,n);
}
