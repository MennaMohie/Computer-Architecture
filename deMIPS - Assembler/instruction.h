#pragma once

#include<iostream>
#include <vector>
#include<map>
#include<string>
#include <unordered_map>
#include <stack>
#include <queue>
#include <math.h>
#include <algorithm>
#include <iomanip>
#include"codeSegment.h"

using namespace std;

class instruction;


extern map<string, int>register_address;
extern map<string, instruction>instruction_format;

void initialize_registers();
void initialize_formats();

class instruction
{
public:
	string name; // add, lw ... etc.
	string line; // add $t3, $zero, $zero
	vector<string> arguments;
	int opCode, funct;
	char type;
	int address;

	instruction();
	instruction(string);
	string convert();

private:
	string R_type_conversion(); // return the binary code of the instruction
	string I_type_conversion(); // return the binary code of the instruction
	string J_type_conversion(); // return the binary code of the instruction
};