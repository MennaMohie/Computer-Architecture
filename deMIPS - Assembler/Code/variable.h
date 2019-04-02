#pragma once

#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <unordered_map>
#include <stack>
#include <queue>
#include <cmath>
#include <algorithm>
#include <iomanip>

using namespace std;

vector<string>split(string, string);
string to_binary_string(int);
string to_binary_string(string);

class variable
{
public:
	string type;
	string label;
	int third_argument;
	int address;

	variable();

	variable(string line);

	string variable_conversion();
};
