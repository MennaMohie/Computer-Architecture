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
#include "variable.h"
using namespace std; 

class dataSegment
{
public:
	static int address_counter; // current location counter of the data segment
	static map<string, variable>variables;
	static vector<string>address_value;

	dataSegment();

	void variable_declartation(string);

	vector<string> data_segment_conversion();
};
