#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        char del = '|';
        size_t tableBreak = line.find(del);
        string strCoded = line.substr(0, tableBreak);
        string key = line.substr(tableBreak + 2);
        string writer = "";
        size_t pos;
        int start = 0;
        char keyDel = ' ';
        do {
            pos = key.find(keyDel, start);
            int n = stoi(key.substr(start, pos - start));
            writer += strCoded[n - 1];
            start = pos + 1;
        }while(pos != string::npos);
        cout << writer << endl;

    }
    return 0;
}
