#include"codeSegment.h"
#include"variable.h"

int codeSegment::address_counter = 0;
map<string, int> codeSegment::label_address;
vector<string> codeSegment::address_value;

codeSegment::codeSegment() {
	initialize_registers();
	initialize_formats();
}

void codeSegment::instruction_declartation(string line) {
	vector<string> label_instr = split(line, ":");
	instruction instr;
	if (label_instr.size() > 1) {
		label_address[label_instr[0]] = address_counter;
		address_value.push_back(label_instr[1]);
	}
	else
		address_value.push_back(label_instr[0]);

	address_counter += 4;	
}

vector<string> codeSegment::code_segment_conversion() {
	vector<string> conversions;
	string mem = "MEMORY(";
	string line;
	for (int i = 0; i < address_value.size(); i++) {
		line = mem;
		line += to_string(i);
		line += ") := \"";
		instruction instr(address_value[i]);
		instr.address = i * 4;
		line += instr.convert();
		line += "\" ;";
		conversions.push_back(line);
	}
	return conversions;
}