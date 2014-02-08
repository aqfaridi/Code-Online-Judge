#include<iostream>
#include<cstdio>
#include<cstring>
#define MAX 1000
using namespace std;
int scan_d() 
{
	int ip=getchar_unlocked(),ret=0,flag=1;
	for(;ip<'0'||ip>'9';ip=getchar_unlocked())if(ip=='-'){flag=-1;ip=getchar_unlocked();break;}
	for(;ip>='0'&&ip<='9';ip=getchar_unlocked())ret=ret*10+ip-'0';
	return flag*ret;
}
void println_d(int n) 
{
	if(n<0){n=-n;putchar_unlocked('-');}
	int i=10;
	char output_buffer[11];
	output_buffer[10]='\n';
	do{output_buffer[--i]=(n%10)+'0';
		n/=10;}while(n);
	do{putchar_unlocked(output_buffer[i]);
	}while(++i<11);
}
struct A
{
	int a[MAX][MAX];
	int b[MAX][MAX];
} mt[101] ;
void fun(int idx , int n , int m)
{
	for(int i = 1 ; i < m ; i++)
		mt[idx].a[0][i] += mt[idx].a[0][i-1] ;
	for(int i = 1 ; i < n ; i++)
		mt[idx].a[i][0] += mt[idx].a[i-1][0];
	for(int i =1 ; i < n ; i++)
	{
		for(int j = 1 ; j < m ; j++)
		{
			mt[idx].a[i][j] = mt[idx].a[i][j] - mt[idx].a[i-1][j-1] + mt[idx].a[i-1][j] + mt[idx].a[i][j-1] ;
		}
	}
	for(int i = 1 ; i < m ; i++)
		mt[idx].b[0][i] += mt[idx].b[0][i-1] ;
	for(int i = 1 ; i < n ; i++)
		mt[idx].b[i][0] += mt[idx].b[i-1][0];
	for(int i =1 ; i < n ; i++)
	{
		for(int j = 1 ; j < m ; j++)
		{
			mt[idx].b[i][j] = mt[idx].b[i][j] - mt[idx].b[i-1][j-1] + mt[idx].b[i-1][j] + mt[idx].b[i][j-1] ;
		}
	}
	/*for(int i = 0 ; i < m ; i++)
	{
	for(int j = 0 ; j < m ; j++)
	cout << mt[idx].a[i][j] << " " ;
	cout << endl ;
	}
	cout << "############################################################# " << endl ;*/
}
int query(int x1 , int y1 , int x2 , int y2 , int idx)
{
	int ans = 0;
	x1--;y1--;x2--;y2--;
	if(x1 == 0 and y1 != 0)
		ans = min(mt[idx].a[x2][y2] - mt[idx].a[x2][y1-1] , mt[idx].b[x2][y2] - mt[idx].b[x2][y1-1]);
	else if(y1 == 0 and x1 != 0)
		ans = min(mt[idx].a[x2][y2] - mt[idx].a[x1-1][y2] , mt[idx].b[x2][y2] - mt[idx].b[x1-1][y2]);  
	else if(x1 == 0 and y1 == 0)
		ans = min(mt[idx].a[x2][y2] , mt[idx].b[x2][y2]);
	else
		ans = min((mt[idx].a[x2][y2] - mt[idx].a[x2][y1-1] - mt[idx].a[x1-1][y2] + mt[idx].a[x1-1][y1-1]), (mt[idx].b[x2][y2] - mt[idx].b[x2][y1-1] - mt[idx].b[x1-1][y2] + mt[idx].b[x1-1][y1-1])) ;
	
	return ans ;
}
int main()
{
	int t , n ,m , val ,q , x1 , x2 , y1 , y2;
	int finalcount = 0;
	t = scan_d();
	while(t--)
	{
		n = scan_d();
		m = scan_d();
		memset(mt,0,sizeof(mt));
		for(int i = 0 ; i < n ; i++)
		{
			for(int j = 0 ; j < m ; j++)
			{
				val = scan_d();
				mt[val].a[i][j] = 1;
			}
		}
		for(int i = 1 ; i <= 10 ; i++)
			fun(i, n,m);
		q= scan_d();
		while(q--)
		{
			finalcount = 0;
			x1 = scan_d();x2 = scan_d(); y1 = scan_d(); y2 = scan_d();
			//scanf("%d%d%d%d",&x1,&y1,&x2,&y2);
			for(int i = 1 ; i <= 10 ; i++)
			{
				int vall = query(x1,y1,x2,y2,i);
				//cout << "val " << i << " " << vall << endl ;
				if(vall > 0)
					finalcount++ ;
			}
			println_d(finalcount);
		}
	}
	return 0;
}
