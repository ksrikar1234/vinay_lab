
https://www.hackerearth.com/challenges/test/nit-ap-qa-1-campus-2023/?login=8fba098522f054e92a43f948a7b1ff1e
https://www.interviewbit.com/ahoy/messages/QeSfFVouRqwUiDU60YiFuk0RsSCFBIxK/click?signature=1663c9093c5aef7ac6d58aac606ece280a322b17&url=https%3A%2F%2Finterviewbit.com%2Ftest%2Fe5b48d65b7%2F%3Fslug%3D8b1b9e8abca2feaf56fa75191918df37597f8bb6
#include <bits/stdc++.h>
#include<iostream>
#include<vector>

using namespace std;

string ltrim(const string &);
string rtrim(const string &);
vector<string> split(const string &);

/*
 * Complete the 'plusMinus' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

void plusMinus(vector<int> arr) {

  float x= 0 , y= 0 , z = 0;
   for(auto i : arr)
   {
       if(i<0)   ++x;
       if(i>0)   ++y;
       if(i==0)  ++z; 
   }
   
   
   float s = x+y+z;
   cout << y/s << endl << x/s << endl << z/s ;
}

int main()
{
    string n_temp;
    getline(cin, n_temp);

    int n = stoi(ltrim(rtrim(n_temp)));

    string arr_temp_temp;
    getline(cin, arr_temp_temp);

    vector<string> arr_temp = split(rtrim(arr_temp_temp));

    vector<int> arr(n);

    for (int i = 0; i < n; i++) {
        int arr_item = stoi(arr_temp[i]);

        arr[i] = arr_item;
    }

    plusMinus(arr);

    return 0;
}

string ltrim(const string &str) {
    string s(str);

    s.erase(
        s.begin(),
        find_if(s.begin(), s.end(), not1(ptr_fun<int, int>(isspace)))
    );

    return s;
}

string rtrim(const string &str) {
    string s(str);

    s.erase(
        find_if(s.rbegin(), s.rend(), not1(ptr_fun<int, int>(isspace))).base(),
        s.end()
    );

    return s;
}

vector<string> split(const string &str) {
    vector<string> tokens;

    string::size_type start = 0;
    string::size_type end = 0;

    while ((end = str.find(" ", start)) != string::npos) {
        tokens.push_back(str.substr(start, end - start));

        start = end + 1;
    }

    tokens.push_back(str.substr(start));

    return tokens;
}
