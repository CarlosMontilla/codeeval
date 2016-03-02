#include <iostream>
#include <fstream>
#include <string>
#include <bitset>
#include <algorithm>

using namespace std;

int main(int argc, char *argv[]){

    ifstream stream(argv[1]);
    string line;

    while(getline(stream, line)){
        char del = ',';
        size_t pos1 = line.find(del);
        size_t pos2 = line.find(del, pos1 + 1);
        int n = stoi(line.substr(0,pos1));
        int p1 = stoi(line.substr(pos1 + 1, pos2 - pos1));
        int p2 = stoi(line.substr(pos2 + 1));
        string binary = bitset<64>(n).to_string();
        reverse(binary.begin(), binary.end());
        string ans =  (binary[p1 -1] == binary[p2 - 1]) ? "true" : "false";
        cout << ans << endl;
    }

    return 0;
}
