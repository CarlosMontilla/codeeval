#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <locale>

using namespace std;

vector<string> printNumber(int);
int main(int argc, char* argv[]){
    ifstream stream(argv[1]);
    string line;

    while(getline(stream, line)){
        vector< vector<string> > digit;
        for(int i = 0; i < line.length(); i++){
            if (isdigit(line[i])){
                digit.push_back(printNumber(line[i] - '0'));
            }
        }
        for(int j = 0; j < digit[0].size(); j++){
            for (int i = 0; i < digit.size(); i++){
                cout << digit[i][j];
            }
            cout << endl;
        }
    }

    return 0;
}


vector<string> printNumber(int n){

    string numbers[6] = {"-**----*--***--***---*---****--**--****--**---**--",
                         "*--*--**-----*----*-*--*-*----*-------*-*--*-*--*-",
                         "*--*---*---**---**--****-***--***----*---**---***-",
                         "*--*---*--*-------*----*----*-*--*--*---*--*----*-",
                         "-**---***-****-***-----*-***---**---*----**---**--",
                         "--------------------------------------------------"};
    int nrows = sizeof(numbers) / sizeof(*numbers);
    int ncol = numbers[0].size();
    int colxdig = ncol / 10;
    int start = n * colxdig;

    vector<string> bigDigit(nrows, "");
    for (int i = 0; i < nrows; i++) {
        bigDigit[i] = numbers[i].substr(start, colxdig);
    }
    return bigDigit;
}
