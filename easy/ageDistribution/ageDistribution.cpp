/*Age distribution problem codeeval
  https://www.codeeval.com/open_challenges/152/
  Programmed by Carlos Montilla
*/


#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

using namespace std;

string ageStatus(int);
int toInt(string);

int main(int argc, char* argv[]){
    ifstream stream(argv[1]);
    string line;

    while(getline(stream, line)){
        int age = toInt(line);
        cout << ageStatus(age) << endl;
    }
    return 0;
}


int toInt(string s){
    int value;
    stringstream convert(s);
    if ( !(convert >> value) )
        value = 0;
    return value;
}

string ageStatus(int age){
    if (age < 0 || age > 100){
        return "This program is for humans";
    }
    else if (age <= 2){
        return "Still in Mama's arms";
    }
    else if (age <= 4){
        return "Preschool Maniac";
    }
    else if (age <= 11){
        return "Elementary school";
    }
    else if (age <= 14){
        return "Middle school";
    }
    else if (age <= 18){
        return "High school";
    }
    else if (age <= 22){
        return "College";
    }
    else if (age <= 65){
        return "Working for the man";
    }
    else{
        return "The Golden Years";
    }
}
