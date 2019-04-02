#include "dataSegment.h"

int dataSegment::address_counter = 0;
map<string, variable> dataSegment::variables;
vector<string> dataSegment::address_value;

dataSegment::dataSegment(){}

void dataSegment::variable_declartation(string line) {
	variable obj(line);
	obj.address = address_counter;

	string value = obj.variable_conversion(); // either "XX...XX" or "00...00"
	// reserve a word (label: .type value)
	address_value.push_back(value);
	address_counter += 4; 
	if (obj.type == ".space")
		for (int i = 1; i < obj.third_argument; i++) {
			// reserve a word
			address_value.push_back(value);
			address_counter += 4;
		}
	variables[obj.label] = obj;
}

vector<string> dataSegment::data_segment_conversion() {
	// move on address_value
	vector<string>binary_translation;
	for (int i = 0; i < address_value.size(); i++) {
		string tmp = "MEMORY(" + to_string(i) + ") <= ";
		tmp += "\"";
		tmp += address_value[i];
		tmp += "\" ;";
		binary_translation.push_back(tmp);
	}
	return binary_translation;
}
