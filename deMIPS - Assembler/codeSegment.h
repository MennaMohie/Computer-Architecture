#pragma once

#include "instruction.h"

using namespace std;

vector<string> SPLIT(string, string);

class codeSegment
{
public:
	static int address_counter; // current location counter of the data segment
	static map<string, int>label_address;
	static vector<string>address_value;

	codeSegment();
	void instruction_declartation(string);
	vector<string> code_segment_conversion();
};