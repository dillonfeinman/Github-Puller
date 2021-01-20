#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

int main(int argc, char** argv){
    ifstream repo_file;
    repo_file.open("repos.txt");

    vector<string> repos;
    string line;
    while(repo_file >> line){
        if(line.find("git_url") != string::npos){ //if string is found
            // cout << "found  " << line << endl;
        } else {
            repos.push_back(line.substr(1,line.length()-3)); //cut off quotes and comma
        }
    }
    
    for(auto i : repos){
        cout << i << endl;
    }


    return 0;
}