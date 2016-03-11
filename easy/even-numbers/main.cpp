/* Determine whether a number is even or not
   codeeval challenge: https://www.codeeval.com/open_challenges/100/
   Programmed by: Carlos Montilla
*/

#include <iostream>
#include <fstream>
#include <string>


using namespace std;

bool isEven(int);


int main(int argc, char* argv[]){
    ifstream stream(argv[1]);
    string line;
    while(getline(stream, line)){
        cout << (int) isEven(stoi(line)) << endl;
    }
}


bool isEven(int n){
    return (n % 2) == 0;
}
