#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

int getNumber(string, int, int);

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        char del = ' ';
        vector <int> data(4,0);
        size_t pos = line.find(del);
        size_t start = 0;
        int count = 0;
        do {
            data[count++] = getNumber(line,start, pos - start);
            start = pos + 1;
            pos = line.find(del, start);
        }while(pos != string::npos);
        data[count] = getNumber(line, start, line.length() - start);

        string result = "";

        if (data[1] > data[3]){
            result += "S";
        }
        else if (data[1] < data[3]){
            result += "N";
        }

        if (data[0] > data[2]){
            result += "W";
        }
        else if (data[0] < data[2]){
            result += "E";
        }

        cout << ((result == "") ? "here" : result) << endl;
    }
    return 0;
}


int getNumber(string s, int pos, int length){
    return stoi(s.substr(pos,length));
}
