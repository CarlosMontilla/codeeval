#include <iostream>
#include <fstream>
#include <ctype.h>
#include <iomanip>


using namespace std;

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        int lower = 0;
        int total = line.size();

        for ( int i = 0 ; i < line.size(); i++){
            if (islower(line[i])){
                lower++;
            }
        }

        cout << fixed;
        cout << setprecision(2);
        float per_lower = float(lower) / total * 100;
        cout << "lowercase: " << per_lower << " uppercase: " << 100 - per_lower<< endl;
    }
    return 0;
}
