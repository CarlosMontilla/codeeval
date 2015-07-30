/* Determine whether a number is even or not
   codeeval challenge: https://www.codeeval.com/open_challenges/100/
   Programmed by: Carlos Montilla
*/

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

bool isEven(int);
int toInt(string);

int main(int argc, char* argv[]){
    ifstream stream(argv[1]);
    string line;
    while(getline(stream, line)){
        int n = toInt(line);
        cout << (int) isEven(n) << endl;
    }
}


bool isEven(int n){
    return (n % 2) == 0;
}

int toInt(string s){
    int value;
    stringstream convert(s);
    if(!(convert >> value))
        value = 0;
    return value;
}
