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

#define pb push_back
#define mp make_pair
#define sz size()
#define ln length()
#define forr(i,a,b)                 for(int i=a;i<b;i++)
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

#define MAX 100010
#define MOD 1000000007
#define gc getchar_unlocked
inline void readNat(LL *x)
{
    register int c = gc();
    *x = 0;
    for(;(c<48 || c>57);c = gc());//ignore whitespace in front
    //2x + 8x = 10x  optimisation
         for(;c>47 && c<58;c = gc()) {*x = (*x<<1) + (*x<<3) + c - 48;}
}
int pre[10][5] = {
                    {1,0,0,0,0},
                    {1,1,1,1,1},
                    {1,2,4,8,6},
                    {1,3,9,7,1},
                    {1,4,6,4,6},
                    {1,5,5,5,5},
                    {1,6,6,6,6},
                    {1,7,9,3,1},
                    {1,8,4,2,6},
                    {1,9,1,9,1}   
                };
int main()
{
    LL t,a,b,pwr;
    readNat(&t);
    while(t--)
    {
        readNat(&a);
        readNat(&b);
        if(a==0 && b==0)
        {
            printf("1\n");
            continue;
        }
        a = a % 10;
        pwr = b % 4;
        if(pwr == 0)    pwr = 4;
        printf("%d\n",pre[a][pwr]);
    }
    return 0; 
}
