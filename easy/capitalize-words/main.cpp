#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        char del = ' ';
        size_t pos = line.find(del, 0);
        line[0] = toupper(line[0]);
        while (pos !=  string::npos){
            line[pos + 1] = toupper(line[pos + 1]);
            pos = line.find(del, pos+1);
        }
        cout << line << endl;
    }
    return 0;
}
