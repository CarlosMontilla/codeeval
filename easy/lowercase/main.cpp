#include <iostream>
#include <fstream>
#include <cctype>
using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        for(char c : line){
            cout << char(tolower(c));
        }
        cout << endl;
    }
    return 0;
}
