#include <iostream>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        vector< vector<int> > table(9, vector<int>(0));
        int start = 0;
        size_t pos;
        char delimiter = ' ';
        int count = 1;
        do {
            pos = line.find(delimiter, start);
            int n = stoi(line.substr(start, pos - start));
            table[n - 1].push_back(count);
            start = pos + 1;
            count++;
        }while(pos != string::npos);

        bool winner_flag = false;
        for(int i = 0; i < 9; i++){
            if (table[i].size() == 1){
                cout << table[i][0];
                winner_flag = true;
                break;
            }
        }

        // if there is not winner print 0
        if (!winner_flag)
            cout << "0";

        cout << endl;


    }
    return 0;
}
