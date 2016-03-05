#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;

vector<string> splitString(string, char);

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        vector<string> words, numbers;

        char delTable = ';';
        char delSubTable = ' ';
        size_t breakPoint = line.find(delTable);
        words = splitString(line.substr(0,breakPoint), delSubTable);
        numbers = splitString(line.substr(breakPoint + 1), delSubTable);

        string null = "\0";
        vector<string> decoded(words.size(),null);

        for(int i = 0; i < numbers.size(); i++){
            int pos = stoi(numbers[i]) - 1;
            decoded[pos] = words[i];
        }

        for(int i = 0; i < words.size(); i++){
            cout << ((decoded[i] == null) ? words[words.size() - 1] : decoded[i]) << " ";
        }
        cout << endl;
    }
    return 0;
}


vector<string> splitString(string s, char del){
    vector<string> data;
    int start = 0;
    size_t pos;
    do{
        pos = s.find(del,start);
        string substr = s.substr(start, pos - start);
        data.push_back(substr);
        start = pos + 1;
    }while(pos != string::npos);
    return data;
}
