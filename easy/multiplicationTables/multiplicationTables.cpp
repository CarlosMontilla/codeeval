/* Solves the codeeval challenge https://www.codeeval.com/open_challenges/23/
   Programmed by: Carlos Montilla
*/

#include <iostream>
#include <iomanip>
using namespace std;

int main(){
    for(int i = 1; i <= 12; i++){
        cout << i;
        for (int j = 2; j <= 12; j++){
            cout << setw(4) << i*j;
        }
        cout << endl;
    }
}

