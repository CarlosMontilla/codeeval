#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

string fizzbuzz(int, int , int);

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        char delimiter = ' ';
        vector<int> numbers;
        int start = 0;
        size_t pos;
        do{
            pos = line.find(delimiter, start);
            int n = stoi(line.substr(start, pos - start));
            numbers.push_back(n);
            start = pos + 1;
        }while(pos != string::npos);
        for (int i = 1; i <= numbers[2]; i++){
            cout << fizzbuzz(i, numbers[0], numbers[1]) << ' ';
        }
        cout << endl;
    }
    return 0;
}

string fizzbuzz(int x, int d1, int d2){
    string answer = "";

    if (x % d1 == 0)
        answer += "F";
    if (x % d2 == 0)
        answer += "B";

    return (answer == "") ? to_string(x) : answer;
}
