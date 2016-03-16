#include <iostream>
#include <fstream>

using namespace std;

string getHiddenDigits(string);

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        string hiddenDigits = getHiddenDigits(line);
        cout << ((hiddenDigits == "") ? "NONE" : hiddenDigits) << endl;
    }
    return 0;
}


string getHiddenDigits(string line){
    string hiddenDigits = "";
    for (int i = 0; i < line.size(); i++){
        char letter = line[i];
        if (letter <= 'j' && letter >= 'a'){
            int digit = letter - 'a';
            hiddenDigits += to_string(digit);
        }
        else if (letter <= '9' && letter >= '0'){
            hiddenDigits += letter;
        }
    }
    return hiddenDigits;
}
