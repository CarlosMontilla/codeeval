#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

int mod(int, int);
int toInt(string);

int main(int argc, char* argv[]){
    ifstream stream(argv[1]);
    string line;
    string delimiter = ",";

    while(getline(stream, line)){
        size_t pos = line.find(delimiter);
        string s1 = line.substr(0, pos); 
        string s2 = line.substr(pos + 1, line.length());
        int n1 = toInt(s1);
        int n2 = toInt(s2);
        cout << mod(n1, n2) << endl;
    }
    return 0;
}

int mod(int x, int y){
    return x - (x / y) * y;
}

int toInt(string s){
    int value;
    stringstream convert(s);
    if ( !(convert >> value) )
        value = 0;
    return value;
}
