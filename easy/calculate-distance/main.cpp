#include <iostream>
#include <fstream>
#include <cmath>
#include <string>
#include <vector>

using namespace std;

vector<int> getPoint (string);
float calculateDistance(vector<int>, vector<int>);


int main(int argc, char *argv[]){
    ifstream stream(argv[1]);
    string line;

    while(getline(stream, line)){
        char del = ')';
        size_t pos = line.find(del);
        string s1 = line.substr(0, pos + 1);
        string s2 = line.substr(pos + 2);
        vector<int> p1 = getPoint(s1);
        vector<int> p2 = getPoint(s2);

        cout << int(calculateDistance(p1, p2)) << endl;

    }

    return 0;
}

vector<int> getPoint(string s){
    vector<int> point(2,0);
    char del = ',';
    size_t pos = s.find(del);
    point[0] = stoi(s.substr(1,pos-1));
    point[1] = stoi(s.substr(pos + 1));
    return point;
}

float calculateDistance(vector<int> p1, vector<int> p2){
    float dx = p1[0] - p2[0];
    float dy = p1[1] - p2[1];
    float dis = sqrt(pow(dx, 2) + pow(dy,2));
    return dis;
}
