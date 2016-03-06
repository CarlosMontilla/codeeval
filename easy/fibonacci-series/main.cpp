// fibonacciSeries.cpp ---

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int nthFib(int);

int main(int argc, char* argv[]){

    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        int n = stoi(line);
        cout << nthFib(n) << endl;
    }

    return 0;

}

int nthFib(int n){
    if (n == 0 ){
        return 0;
    }
    else if (n == 1){
        return 1;
    }
    else{
        int n0 = 0;
        int n1 = 1;
        int n2;
        for (int i = 2; i <= n; i++){
            n2 = n1 + n0;
            n0 = n1;
            n1 = n2;
        }
        return n1;
    }
}
