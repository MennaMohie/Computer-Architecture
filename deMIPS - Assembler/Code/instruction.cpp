#include "instruction.h"
#include "dataSegment.h"


map<string, int> register_address;
void initialize_registers() {
	int number = 0;
	string tmp;
	register_address["$zero"] = number++;
	register_address["$at"] = number++;
	register_address["$v0"] = number++;
	register_address["$v1"] = number++;
	for (char c = '0'; c <= '3'; c++) {
		tmp = "$a";
		tmp += c;
		register_address[tmp] = number++;
	}
	for (char c = '0'; c <= '7'; c++) {
		tmp = "$t";
		tmp += c;
		register_address[tmp] = number++;
	}
	for (char c = '0'; c <= '7'; c++) {
		tmp = "$s";
		tmp += c;
		register_address[tmp] = number++;
	}
	for (char c = '8'; c <= '9'; c++) {
		tmp = "$t";
		tmp += c;
		register_address[tmp] = number++;
	}
	register_address["$k0"] = number++;
	register_address["$k1"] = number++;
	register_address["$gp"] = number++;
	register_address["$sp"] = number++;
	register_address["$fp"] = number++;
	register_address["$ra"] = number++;
}

map<string, instruction> instruction_format;
void initialize_formats() {
	instruction instr;
	instr.name = "add";
	instr.opCode = 0;
	instr.type = 'R';
	instr.funct = 32;
	instruction_format["add"] = instr;

	instr.name = "and";
	instr.opCode = 0;
	instr.type = 'R';
	instr.funct = 36;
	instruction_format["and"] = instr;

	instr.name = "sub";
	instr.opCode = 0;
	instr.type = 'R';
	instr.funct = 34;
	instruction_format["sub"] = instr;

	instr.name = "nor";
	instr.opCode = 0;
	instr.type = 'R';
	instr.funct = 39;
	instruction_format["nor"] = instr;

	instr.name = "or";
	instr.opCode = 0;
	instr.type = 'R';
	instr.funct = 37;
	instruction_format["or"] = instr;

	instr.name = "slt";
	instr.opCode = 0;
	instr.type = 'R';
	instr.funct = 42;
	instruction_format["slt"] = instr;

	instr.name = "addi";
	instr.opCode = 8;
	instr.type = 'I';
	instruction_format["addi"] = instr;

	instr.name = "lw";
	instr.opCode = 35;
	instr.type = 'I';
	instruction_format["lw"] = instr;

	instr.name = "sw";
	instr.opCode = 43;
	instr.type = 'I';
	instruction_format["sw"] = instr;

	instr.name = "beq";
	instr.opCode = 4;
	instr.type = 'I';
	instruction_format["beq"] = instr;

	instr.name = "bne";
	instr.opCode = 5;
	instr.type = 'I';
	instruction_format["bne"] = instr;

	instr.name = "j";
	instr.opCode = 2;
	instr.type = 'J';
	instruction_format["j"] = instr;
}

instruction::instruction() {}

instruction::instruction(string line) {
	instruction instrFormat;
	this->line = line;
	arguments = split(line, ", ()");
	name = arguments[0];
	instrFormat = instruction_format[name];
	type = instrFormat.type;
	opCode = instrFormat.opCode;
	funct = instrFormat.funct;
}

string instruction::convert() {
	if (type == 'R')
		return R_type_conversion();
	else if (type == 'I')
		return I_type_conversion();
	else
		return J_type_conversion();
}

string instruction::R_type_conversion() {
	string conversion;
	conversion += to_binary_string(opCode).substr(32 - 6); //opCode, 6 bits
	conversion += to_binary_string(register_address[arguments[2]]).substr(32 - 5); //rs, 5 bits
	conversion += to_binary_string(register_address[arguments[3]]).substr(32 - 5); //rt, 5 bits
	conversion += to_binary_string(register_address[arguments[1]]).substr(32 - 5); //rd, 5 bits
	conversion += to_binary_string(0).substr(32 - 5); //shamt = 0, 5 bits
	conversion += to_binary_string(funct).substr(32 - 6); //funct, 6 bits
	return conversion;
}

string instruction::I_type_conversion() {
	string conversion;
	conversion += to_binary_string(opCode).substr(32 - 6);
	if (name == "lw" || name == "sw") {
		conversion += to_binary_string(register_address[arguments[3]]).substr(32 - 5); //rs
		conversion += to_binary_string(register_address[arguments[1]]).substr(32 - 5); //rt

		if (dataSegment::variables.find(arguments[2]) != dataSegment::variables.end())
			conversion += to_binary_string(dataSegment::variables[arguments[2]].address).substr(32 - 16);
		else if (arguments[2].size() >= 3 && arguments[2][0] == '0' && arguments[2][1] == 'x') {
			string hexOffset = arguments[2];
			conversion += to_binary_string(hexOffset).substr(32 - 16);
		}
		else {
			int decimalOffset = stoi(arguments[2]);
			conversion += to_binary_string(decimalOffset).substr(32 - 16);
		}
	}
	if (name == "addi") {
		conversion += to_binary_string(register_address[arguments[2]]).substr(32 - 5);
		conversion += to_binary_string(register_address[arguments[1]]).substr(32 - 5);

		if (arguments[3].size() >= 3 && arguments[3][0] == '0' && arguments[3][1] == 'x') {
			string hexImmediate = arguments[3];
			conversion += to_binary_string(hexImmediate).substr(32 - 16);
		}
		else {
			int decimalImmediate = stoi(arguments[3]);
			conversion += to_binary_string(decimalImmediate).substr(32 - 16);
		}
	}

	if (name == "bne" || name == "beq") {
		conversion += to_binary_string(register_address[arguments[1]]).substr(32 - 5);
		conversion += to_binary_string(register_address[arguments[2]]).substr(32 - 5);
		int PC = address + 4;
		int labelAddress = codeSegment::label_address[arguments[3]];
		int offset = (labelAddress - PC) / 4;
		conversion += to_binary_string(offset).substr(32 - 16);
	}
	return conversion;
}

string instruction::J_type_conversion() {
	string conversion = to_binary_string(opCode).substr(32 - 6);
	int labelAddress = codeSegment::label_address[arguments[1]];
	labelAddress /= 4;
	conversion += to_binary_string(labelAddress).substr(32 - 26);
	return conversion;
}

