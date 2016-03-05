#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

vector<int> compressSequence(vector<int>);

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        vector<int> data;
        char del = ' ';
        size_t pos = 0;
        while(pos != string:: npos){
            pos = line.find(del);
            data.push_back(stoi(line.substr(0, pos)));
            line.erase(0,pos + 1);
        }

        vector<int> compressed = compressSequence(data);
        for(int i = 0; i < compressed.size(); i++){
            cout << compressed[i] << " ";
        }
        cout << endl;
    }
    return 0;
}


vector<int> compressSequence(vector<int> lst){
    vector<int> seq;

    seq.push_back(1);
    seq.push_back(lst[0]);

    int pos = 0;
    for (int i = 1; i < lst.size(); i++){
        if (lst[i] == seq[pos + 1]){
            seq[pos]++;
        }
        else{
            seq.push_back(1);
            seq.push_back(lst[i]);
            pos += 2;
        }
    }

    return seq;
}
