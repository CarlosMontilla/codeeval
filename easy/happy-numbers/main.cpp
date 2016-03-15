#include <iostream>
#include <fstream>
#include <string>
#include <unordered_map>
using namespace std;


bool isHappy(int);
int squareDigits(int);

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        int n = stoi(line);
        cout << ((isHappy(n)) ? 1 : 0) << endl;
    }
    return 0;
}


bool isHappy(int n){
    unordered_map<int, bool> iterations;
    iterations[n] = true;
    int MAX_ITER = 10000;

    for (int i = 1; i < MAX_ITER; i++){
        int next_iter = squareDigits(n);
        unordered_map<int, bool>::const_iterator key_pos = iterations.find(next_iter);
        if (next_iter == 1){
            return true;
        }
        else if (key_pos == iterations.end()){
            iterations[next_iter] = true;
        }
        else{
            return false;
        }
        n = next_iter;
    }

    return true;
}

int squareDigits(int n){
    int sum = 0;
    string n_string = to_string(n);
    for (int i = 0 ; i < n_string.size(); i++){

        int digit = (n_string[i] - '0');
        sum += (digit * digit);
    }


    return sum;
}
