#include <iostream>
#include <fstream>
#include <string>
#include <ctype.h>

using namespace std;


string str2lower(string);

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)){
        string cleanStr = "";
        int status = 0;
        for (size_t i = 0; i < line.length(); i++){
            if(isalpha(line[i])){
                cout << (char) tolower(line[i]);
                status = 1;
            }
            else if (status == 1){
                status = 0;
                cout << ' ';
            }
        }
        cout << endl;
    }
    return 0;
}


string str2lower(string s){
    string lower = s;
    for (size_t i = 0; i < s.length(); i++){
        lower[i] = tolower(s[i]);
    }
    return lower;
}
