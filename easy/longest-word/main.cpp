#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        string longest = "";
        int start = 0;
        size_t pos;
        char delimiter = ' ';

        do{
            pos = line.find(delimiter, start);
            string word = line.substr(start, pos - start);
            longest = (word.size() > longest.size()) ? word : longest;
            start = pos + 1;
        }while(pos != string::npos);

        cout << longest << endl;
    }

    return 0;
}
