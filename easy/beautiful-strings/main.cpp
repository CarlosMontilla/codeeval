#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int beauty(string);
vector<int> points(string);

int main(int argc, char *argv[]){
    ifstream stream(argv[1]);
    string line;

    while(getline(stream, line)){
        cout << beauty(line) << endl;
    }

    return 0;
}


int beauty(string line){
    int total = 0;
    vector<int> table = points(line);
    sort(table.begin(), table.end());
    for (int i = 25; i >= 0; i--){
        total += (i + 1) * table[i];
    }
    return total;
}

vector<int> points(string line){
    vector<int> table(26, 0);
    for (int i = 0; i < line.size(); i++){
        char c = tolower(line[i]);
        if (isalpha(c)){
            table[c - 97] += 1;
        }
    }
    return table;
}
