#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        char delimiter = ' ';
        size_t pos;
        int start = 0;
        vector<string> words;
        do {
            pos = line.find(delimiter, start);
            words.push_back(line.substr(start, pos - start));
            start = pos + 1;
        } while (pos != string::npos);


        for(int i = words.size() - 1; i > 0; i--){
            cout << words[i] << " ";
        }
        cout << words[0];
        cout << endl;
    }
    return 0;
}
