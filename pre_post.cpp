#include<bits/stdc++.h>

using namespace std;

stack<char>st;
string str,ans;
int precedence(char c){
    
	if(c=='^') return 2;
	if(c=='*' || c=='/') return 1;
	if(c=='+' || c=='-') return 0;

}
int main()
{
    int i,j,k,l,m,n;
    char ch;
    //cin>>str;
    str = "A+(B*C-(D/E^F)*G)*H";//"k+l-m*n+(o^p)*w/u/v*t+q";//1*2/3+(4-5^6)+7-8";
    //A+(B*C-(D/E^F)*G)*H";//"(A-B)*(D/E)";//"A*(B+C*D)+E";
    str = str ;
    ans = "";
    for(i=0; i<str.size(); i++)
    {
        char c=str[i];
        if(isalpha(str[i])) ans+=str[i];
        else if(c=='(') st.push('(');
        else if(str[i]==')'){
            while(st.top()!='('){
                    ans+=st.top();
                    st.pop();
                  }
                  st.pop();
        }
        else{
            while(!st.empty() && (c)<=precedence(st.top())){
                ans+=st.top();
                st.pop();
            }
            st.push(c);
        }
        
    }
    while(!st.empty()){
        ans+=st.top();
        st.pop();
    }

    cout<<ans<<endl;

    return 0;
}
