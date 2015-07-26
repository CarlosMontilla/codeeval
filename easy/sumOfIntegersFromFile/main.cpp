#include <iostream>
#include <fstream>
#include <string>
#include <sstream>


using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    int sum = 0;

    while (getline(stream, line)) {

        int value;
        stringstream convert(line);
        if ( !(convert >> value) )
            value = 0;
        sum += value;
    }
    cout << sum << endl;
    return 0;
}
