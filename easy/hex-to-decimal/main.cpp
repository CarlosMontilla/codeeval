#include <iostream>
#include <fstream>
#include <sstream>

using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        stringstream line_stream;
        int dec;
        line_stream << hex << line;
        line_stream >> dec;
        cout << dec << endl;
    }
    return 0;
}
