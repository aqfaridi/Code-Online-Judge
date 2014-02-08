#include <iostream>
#include <cstdio>
#include <algorithm>
#include <cstring>
#include <sstream>
#include <vector>
#include <iomanip>
#include <cmath>
#include <set>
#include <map>
#include <queue>

using namespace std;
typedef long long LL;
typedef pair<int,int> pii;
typedef pair<int,pair<int,int> > tri;
typedef vector<vector<int> > vvi;
typedef vector<int> vi;

#define MaX 1010
int arr[MaX];
int arr2[MaX][MaX];
int n,m;

#define pb push_back
#define mp make_pair
#define sz size()
#define ln length()
#define forr(i,a,b)                 for(int i=a;i<b;i++)
#define fore(i,a,b)                 for(int i=a;i<=b;i++)
#define rep(i,n)                    forr(i,0,n)
#define all(v)                      v.begin(),v.end()
#define uniq(v)                     sort(all(v));v.erase(unique(all(v)),v.end())
#define clr(a)                      memset(a,0,sizeof a)

#define debug                       if(1)
#define debugoff                    if(0)

#define print(x)                 cerr << x << " ";
#define pn()                     cerr << endl;
#define trace1(x)                cerr << #x << ": " << x << endl;
#define trace2(x, y)             cerr << #x << ": " << x << " | " << #y << ": " << y << endl;
#define trace3(x, y, z)          cerr << #x << ": " << x << " | " << #y << ": " << y << " | " << #z << ": " << z << endl;

ostream& operator<<(ostream& out,vi& v)
{
    for(int x=0;x<v.size();x++)
        out << v[x];
    out << endl;
    return out;
}
ostream& operator<<(ostream& out,vvi& v)
{
    int n = v.size();
    int m = v[0].size();
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++)
            out<<v[i][j]<<" ";
        out<<endl;
    }
    return out;
}

void print_arr(int arr[],int n)
{
    for(int i=0;i<n;i++)
        cout<<arr[i]<<" ";
    cout<<endl;
}

void print_arr2d(int arr2[][MaX],int n,int m)
{
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++)
            cout<<arr2[i][j]<<" ";
        cout<<endl;
    }
}

void print_vi(vi& v,int n)
{
    for(int i=0;i<n;i++)
        cout<<v[i]<<" ";
    cout<<endl;
}

void print_vii(vvi& v,int n,int m)
{
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++)
            cout<<v[i][j]<<" ";
        cout<<endl; 
    }
}

string end = "============******=============\n";

#define MAX 820
#define MOD 1000000007
vi inner(MAX,0);
vvi a(MAX,inner);
vvi cumm(MAX,inner);
vvi cummb(MAX,inner);

int main()
{
    ios::sync_with_stdio(false);
	int n;
	cin>>n;
	for(int i=1;i<=n;i++)
		for(int j=1;j<=n;j++)
			cin>>a[i][j];
	
	for(int i=1;i<=n;i++)
		cumm[1][i] = a[1][i];
	for(int i=1;i<=n;i++)
		cumm[i][1] = a[i][1];
	for(int i=2;i<=n;i++)
		for(int j=2;j<=n;j++)
			cumm[i][j] = cumm[i-1][j-1] + a[i][j];
			
	for(int i=1;i<=n;i++)
		cummb[n][i] = a[n][i];
	for(int i=1;i<=n;i++)
		cummb[i][1] = a[i][1];
	for(int i=n-1;i>=1;i--)
		for(int j=2;j<=n;j++)
            cummb[i][j] = cummb[i+1][j-1] + a[i][j];

/*
    cout<<cumm;
    cout<<end;
    cout<<cummb;
    cout<<end;
*/


	int maxx = 0; 
	int two_i,two_j,three_i,three_j,four_i,four_j;
	for(int size=1;size<=n;size++)
	{
		for(int i=1;i<=n;i++)
			for(int j=1;j<=n;j++)
			{
				two_i = i+size-1;two_j = j+size-1;
				three_i = i+size-1;three_j = j;
				four_i = i;four_j = j+size-1;	
				
                if(two_i < 1 || two_i > n || two_j < 1 || two_j > n || three_i < 1 || three_i > n || three_j <1 || three_j > n || four_i < 1 || four_i > n || four_j < 1 || four_j > n)
                    continue;

                //cout<<cumm[two_i][two_j]<<" "<<cumm[i-1][j-1]<<" "<<cummb[four_i][four_j]<<" "<<cummb[three_i+1][three_j-1]<<endl;
				maxx = max(maxx,(cumm[two_i][two_j] - cumm[i-1][j-1])  - (cummb[four_i][four_j] - cummb[three_i+1][three_j-1])); 
			}
	}
	cout<<maxx<<endl;
	
    return 0;
}
