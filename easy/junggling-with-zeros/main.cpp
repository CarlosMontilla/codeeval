#include <iostream>
#include <fstream>
#include <bitset>
#include <string>
using namespace std;


int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        string decoded = "";
        char delimiter = ' ';
        int start = 0;
        size_t pos;
        bool zero_flag = true;
        do {

            pos = line.find(delimiter, start);
            int flag = pos - start - 1;
            start = pos + 1;
            pos = line.find(delimiter, start);
            int n_zeros = line.substr(start, pos - start).size();
            start = pos + 1;
            //ignoring leadign zeros
            if (flag == 1 || !zero_flag){
                decoded += string(n_zeros, '0' + flag);
                zero_flag = false;
            }
        }while(pos != string::npos);

        bitset<64> binary(decoded);
        cout << binary.to_ullong() << endl;

    }
    return 0;
}
