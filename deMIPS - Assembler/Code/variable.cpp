#include "variable.h"

variable::variable(){}

vector<string>split(string line, string delim) {
	vector<string> result;
	string tmp = "";
	for (int i = 0; i <= line.size(); i++) {
		if (i == line.size() || delim.find(line[i]) != string::npos) {
			if(!tmp.empty())
				result.push_back(tmp);
			tmp.clear();
			continue;
		}
		tmp += line[i];
	}
	return result;
}

string to_binary_string(int decimal) {
	string result;
	bool isNegative = (decimal < 0);
	if (isNegative)
		decimal *= -1;
	while (decimal) {
		result += char((decimal % 2) + '0');
		decimal /= 2;
	}
	while (result.size() < 32)
		result += '0';
	if (isNegative) {
		int first_1 = result.find('1');
		if (first_1 != string::npos)
			for (int i = first_1 + 1; i < 32; i++)
				result[i] = (result[i] == '0') ? '1' : '0';
	}
	reverse(result.begin(), result.end());
	return result;
}

string to_binary_string(string hex) {
	string bin;
	for (int i = hex.size() - 1; i >= 0; i--) {
		switch (toupper(hex[i])) {
		case '0': bin+= "0000";
		case '1': bin+= "0001";
		case '2': bin+= "0010";
		case '3': bin+= "0011";
		case '4': bin+= "0100";
		case '5': bin+= "0101";
		case '6': bin+= "0110";
		case '7': bin+= "0111";
		case '8': bin+= "1000";
		case '9': bin+= "1001";
		case 'A': bin+= "1010";
		case 'B': bin+= "1011";
		case 'C': bin+= "1100";
		case 'D': bin+= "1101";
		case 'E': bin+= "1110";
		case 'F': bin+= "1111";
		}
	}
	while (bin.size() < 32)
		bin += '0';
	reverse(bin.begin(), bin.end());
	return bin;
}


variable::variable(string line) {
	vector<string>arguments;
	arguments = split(line, " ,():");
	label = arguments[0];
	type = arguments[1];
	third_argument = stoi(arguments[2]);
}

string variable::variable_conversion() {
	// convert the value in the variable to "XXX...XX" or binary value
	string binary_value;
	if (type == ".space")
		for (int i = 0; i < 32; i++)
			binary_value += 'X';
	else
		binary_value = to_binary_string(third_argument);
	return binary_value;
}
