#include <iostream>
#include <fstream>
#include <string>

using namespace std;

string findPenultimate(string);

int main(int argc, char* argv[]){
    ifstream stream(argv[1]);
    string line;
    while(getline(stream, line)){
        cout << findPenultimate(line) << endl;
    }

    return 0;
}


string findPenultimate(string s){
    char del = ' ';
    int start;
    int end = -1;
    size_t pos = s.find(del);

    while(pos != string::npos){
        start = end + 1;
        end = pos;
        pos = s.find(del, pos + 1);
    }
    return s.substr(start, end - start);
}
