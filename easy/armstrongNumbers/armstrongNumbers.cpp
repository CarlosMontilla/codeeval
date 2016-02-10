/* Solve the codeeval problem:
   https://www.codeeval.com/open_challenges/82/
   Programmed by: Carlos Montilla */

#include <iostream>
#include <fstream>
#include <string>
#include <cmath>

using namespace std;


bool isArmstrong(int, int);

int main(int argc, char* argv[]){
    ifstream stream(argv[1]);
    string line;

    while (getline(stream, line)){
        if (isArmstrong(stoi(line), line.length()))
            cout << "True\n";
        else
            cout << "False\n";
    }
    return 0;
}


bool isArmstrong(int i, int l){
    int n = i;
    int d;
    int sum = 0;
    while (n > 0){
        d = n % 10;
        sum += pow(d, l);
        n /= 10;
    }
    return sum==i;
}
