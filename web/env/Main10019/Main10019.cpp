//#include <bits/stdc++.h>
#include<iostream>
#include<cstdio>
#include<stdlib.h>
#include<iomanip>
#include<math.h>
#include<limits.h>
#include<string.h>
#include<algorithm>
#include<vector>
#include<stack>
#include<queue>
#include<map>
#include<bitset>
#define mod 1000000007
#define MAX 100000000

using namespace std;
#define scan(a) scanf("%d",&a);
#define print(a) printf("%d\n",a);
#define mem(a,v) memset(a,v,sizeof(a))
#define clr(a) memset(a,0,sizeof(a))
#define pb(x) push_back(x)
#define sort(a) sort(a.begin(),a.end())
#define inf 1e9
#define mp(a,b) make_pair(a,b)
#define V vector
#define S string
#define Gu getchar_unlocked
#define Pu putchar_unlocked
#define Read(n) ch=Gu(); while (ch<'0') ch=Gu(); n=ch-'0'; ch=Gu(); while (!(ch<'0')) {n=10*n+ch-'0'; ch=Gu();}
#define Write(n) r=n; chptr=s; *chptr=r%10+'0'; r/=10; for (; r; r/=10) {++chptr; *chptr=r%10+'0'; } Pu(*chptr); for (; chptr!=s; ) Pu(*--chptr);
typedef long long LL;
typedef long double LD;
typedef long L;
typedef pair<int,int> pii;
const double pi=acos(-1.0);
int main()
{
   	/*int ch;
   	int r;
   	char s[12];
   	char *chptr;*/
   	freopen("in.txt","r",stdin);
   	freopen("out.txt","w",stdout);
	int t;
	cin>>t;
	while(t--)
	{
		int a,b,c;
		double x,y,z;
		cin>>a>>b>>c;
		x=(a-(2.0*b-c));
		if(x<0)
			x=-x;
		y=(b-(a+c)/2.0);
		if(y<0)
			y=-y;
		z=(c-(2.0*b-a));
		if(z<0)
			z=-z;
		double ans=min(x,min(y,z));
		printf("%.3lf\n",ans);
	}
	return 0;
}




