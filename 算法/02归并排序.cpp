#include<bits/stdc++.h>
using namespace std;

const int N=100010;
int q[N],tmp[N];
int n;

void Merge_sort(int q[],int l,int r)
{
	if(l>=r)	return;
	int mid=l+r>>1;
	Merge_sort(q,l,mid),Merge_sort(q,mid+1,r);
	
	int k=0,i=l,j=mid+1;
	while (i <= mid && j <= r)
	{
		if(q[i]<=q[j])	tmp[k++]=q[i++];
		else	tmp[k++]=q[j++];
	}
	while(i<=mid)	tmp[k++]=q[i++];
	while(j<=r)	tmp[k++]=q[j++];
	
	for(int i=l,j=0;i<=r;i++,j++)	q[i]=tmp[j];
}

int main()
{
	cin>>n;
	for(int i=0;i<n;i++)
	{
		scanf("%d",&q[i]);
	}
	Merge_sort(q,0,n-1);
	
	for(int i=0;i<n;i++)
	{
		printf("%d",q[i]);
	}	
}
