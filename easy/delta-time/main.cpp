#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <stdlib.h>

using namespace std;

int mod(int, int);

class Time{
private:
    vector<int> time_vector;

    int compareInt(int i, int j){
        if (i > j){return 1;}
        else if (i < j){return -1;}
        else {return 0;}
    }

public:
    Time(int hour, int min, int sec){
        time_vector.push_back(hour);
        time_vector.push_back(min);
        time_vector.push_back(sec);
    }

    Time(string s){
        char del = ':';
        int start = 0;
        size_t pos = 0;
        do{
            pos = s.find(":", start);
            time_vector.push_back(stoi(s.substr(start, pos - start)));
            start = pos + 1;
        }while(pos != string::npos);

    }

    int compare(Time t){
        vector<int> vector_t2 = t.getVector();
        for (int i = 0; i < 3; i++){
            int comp = compareInt(time_vector[i], vector_t2[i]);
            if (comp != 0){
                return comp;
            }
        }
        return 0;
    }

    Time diff(Time t){
        int comp = compare(t);
        if (comp == 1){
            vector<int> vector_t2 = t.getVector();
            vector<int> diff = {0,0,0};
            vector<int> minus = {0,0,0,0};
            vector<int> max = {24, 60, 60};

            for (int i = 2 ; i >= 0; i--){
                if (vector_t2[i] > time_vector[i]){
                    minus[i-1] += 1;
                }
                diff[i] =mod(time_vector[i] - vector_t2[i], max[i]) - minus[i];
            }

            return Time(diff[0], diff[1], diff[2]);
        }
        else if (comp == -1){
            return t.diff(*this);
        }
        else{
            return Time(0,0,0);
        }
    }

    string print(void){
        string str = "";
        for (int i = 0; i < 3; i++){
            if (time_vector[i] < 10){
                str += "0";
            }
            str += to_string(time_vector[i]) + ":";
        }
        return str.substr(0, str.size() - 1);
    }

    vector<int> getVector(void){
        return time_vector;
    }
};

int main(int argc, char *argv[]) {
    ifstream stream(argv[1]);
    string line;
    while (getline(stream, line)) {
        char del = ' ';
        size_t pos = line.find(del);
        Time t1(line.substr(0,pos));
        Time t2(line.substr(pos + 1));
        Time diff = t1.diff(t2);
        cout << diff.print() << endl;
    }
    return 0;
}


int mod (int a, int b)
{
    if(b < 0) //you can check for b == 0 separately and do what you want
        return mod(-a, -b);
    int ret = a % b;
    if(ret < 0)
        ret+=b;
    return ret;
}
