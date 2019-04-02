#include"dataSegment.h"
#include"codeSegment.h"
#include<fstream>

dataSegment ds;
codeSegment cs;

int main() {
	ifstream input_file;
	input_file.open("input.txt");

	string line_of_MIPS;
	bool data_segment = 0;
	bool code_segment = 0;
	while (getline(input_file, line_of_MIPS)) {
		string MIPS_instruction;
		bool ignore_spaces = 1;
		for (int i = 0; i < line_of_MIPS.size(); i++) {
			if (ignore_spaces && line_of_MIPS[i] == ' ')
				continue;
			ignore_spaces = 0;
			MIPS_instruction += line_of_MIPS[i];
		}

		int hashPos = MIPS_instruction.find('#');
		if (hashPos != string::npos)
			MIPS_instruction = MIPS_instruction.substr(0, hashPos);

		if (MIPS_instruction.empty())
			continue;

		if (MIPS_instruction.find(".data") != string::npos) {
			data_segment = 1;
			continue;
		}

		if (MIPS_instruction.find(".text") != string::npos) {
			code_segment = 1;
			continue;
		}


		if (code_segment) {
			cs.instruction_declartation(MIPS_instruction);
		}
		else if (data_segment) {
			ds.variable_declartation(MIPS_instruction);
		}
	}
	input_file.close();

	ofstream ds_output_file;
	ds_output_file.open("data.txt");
	ds_output_file << "#Translation of Data Segment\n";
	vector<string>ds_translation = ds.data_segment_conversion();
	for (int i = 0; i < ds_translation.size(); i++)
		ds_output_file << ds_translation[i] << '\n';
	ds_output_file.close();
	
	ofstream cs_output_file;
	cs_output_file.open("code.txt");
	cs_output_file << "#Translation of Code Segment\n";
	vector<string>code_segment_translation = cs.code_segment_conversion();
	for (int i = 0; i < code_segment_translation.size(); i++)
		cs_output_file << code_segment_translation[i] << '\n';
	cs_output_file.close();

	system("pause");
}
