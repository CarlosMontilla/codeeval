#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int getDistance(string);

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        char row_del = ',';
        int start = 0;
        size_t pos;
        int max_dist = 11;
        do {
            pos = line.find(row_del, start);
            string row = line.substr(start, pos - start);
            int dis = getDistance(row);
            max_dist = (dis < max_dist) ? dis : max_dist;
            start = pos + 1;
            if (max_dist == 0)
                break;
        }while (pos != string::npos);
        cout << max_dist << endl;
    }
    return 0;
}

int getDistance(string row){
    int distance = 0;
    char left_detail = 'X';
    char space = '.';
    char right_detail = 'Y';
    for (int i = 0; i < row.size(); i++){
        if (row[i] == left_detail){
            distance = 0;
        }
        else if (row[i] == space){
            distance++;
        }
        else{
            return distance;
        }
    }

    return distance;
}
