#include<bits/stdc++.h>
using namespace std;

const int N=100010;
int q[N];
int n;


void Quick_sort(int q[],int l,int r)
{
	if(l>=r)	return;
	int i=l-1,j=r+1,x=q[l+r>>1];
	while(i<j)
	{
		do i++;while(q[i]<x);
		do j--;while(q[j]>x);
		if(i<j)	swap(q[i],q[j]);
	}
	Quick_sort(q,l,j),Quick_sort(q,j+1,r);
}

int main()
{
	cin>>n;
	for(int i=0;i<n;i++)
	{
		cin>>q[i];
	}
	cout<<endl;
	Quick_sort(q,0,n-1);
//	一般用这两行能够代替 
//    ios::sync_with_stdio(false);
//	sort(q,q+n);
	for(int i=0;i<n;i++)
	{
		cout<<q[i]<<" "; 
	}
	
}
