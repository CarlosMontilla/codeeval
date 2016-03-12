#include <iostream>
#include <string>
#include <fstream>
#include <vector>

using namespace std;

void printMax(vector< vector<int> > table);
vector< vector<int> > getTable(string line);
vector<int> getRow(string line);

int main(int argc, char* argv[]){
    ifstream file;
    file.open(argv[1]);

    string line;
    while(getline(file, line)){
        //cout << line << endl;
        printMax(getTable(line));
        cout << endl;
    }
    return 0;
}


vector< vector<int> > getTable(string line){
    vector< vector<int> > table;
    size_t in = 0;
    size_t end;
    string del = " | ";
    do{
        end = line.find(del, in);
        table.push_back(getRow(line.substr(in, end - in)));
        in = end + del.length();
    }while(end != string::npos);
    return table;
}

vector<int> getRow(string line){
    vector<int> row;
    size_t in = 0;
    size_t end;
    string del=" ";
    do{
        end = line.find(del, in);
        row.push_back(stoi(line.substr(in, end)));
        in = end + del.length();
    }while(end != string::npos);
    return row;
}

void printMax(vector< vector<int> > table){
    vector<int> maxs;
    int nrow = table.size();
    int ncol = table[0].size();
    for (int j = 0; j < ncol; j++){
        int max = -100000;
        for (int i = 0; i < nrow; i++){
            max = (table[i][j] > max) ? table[i][j] : max;
        }
        cout << max << " ";
    }
}
