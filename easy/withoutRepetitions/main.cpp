#include <iostream>
#include <fstream>

using namespace std;

string deleteRep(string);

int main(int argc, char* argv[]){
    ifstream stream(argv[1]);
    string line;
    while(getline(stream, line)){
        cout << deleteRep(line) << endl;
    }

    return 0;
}


string deleteRep(string s){
    string newStr = "";
    newStr += s[0];
    for (int i = 1; i < s.length(); i++){
        if(s[i] != s[i-1]){
            newStr += s[i];
        }
    }
    return newStr;
}
