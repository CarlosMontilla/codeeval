#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(int argc, char* argv[]){

    ifstream stream(argv[1]);
    string line, t1, t2;
    char tabDel = '|';

    while(getline(stream, line)){
        size_t pos = line.find(tabDel);
        t1 = line.substr(0, pos-1);
        t2 = line.substr(pos+2);
        char numDel = ' ';
        size_t start_t1 = 0, start_t2 = 0;
        size_t end_t1 = 0, end_t2 = 0;
        while(end_t1 != string::npos){
            int n1, n2;
            end_t1 = t1.find(numDel, start_t1);
            end_t2 = t2.find(numDel, start_t2);
            n1 = stoi(t1.substr(start_t1, end_t1 - start_t1));
            n2 = stoi(t2.substr(start_t2, end_t2 - start_t2));
            cout << n1 * n2 << " ";
            start_t1 = end_t1 + 1;
            start_t2 = end_t2 + 1;
        }
        cout << endl;
    }

    return 0;
}
