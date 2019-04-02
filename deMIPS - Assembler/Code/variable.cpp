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
	// (i >= 2), cause 0x...
	for (int i = hex.size() - 1; i >= 2; i--) {
		string tmp;
		switch (toupper(hex[i])) {
		case '0': tmp = "0000"; break;
		case '1': tmp = "0001";	break;
		case '2': tmp = "0010";	break;
		case '3': tmp = "0011";	break;
		case '4': tmp = "0100";	break;
		case '5': tmp = "0101";	break;
		case '6': tmp = "0110";	break;
		case '7': tmp = "0111";	break;
		case '8': tmp = "1000";	break;
		case '9': tmp = "1001";	break;
		case 'A': case 'a': tmp = "1010"; break;
		case 'B': case 'b': tmp = "1011"; break;
		case 'C': case 'c': tmp = "1100"; break;
		case 'D': case 'd': tmp = "1101"; break;
		case 'E': case 'e': tmp = "1110"; break;
		case 'F': case 'f': tmp = "1111";
		}
		bin = tmp + bin;
	}
	while (bin.size() < 32)
		bin = '0' + bin;
	return bin;
}


variable::variable(string line) {
	vector<string>arguments;
	arguments = split(line, " ,():");
	label = arguments[0];
	type = arguments[1];
	if (arguments[2].size() > 2 && arguments[2][1] == 'x' && arguments[2][0] == '0')
		third_argument = stoul(arguments[2], NULL, 16);
	else
		third_argument = stoul(arguments[2]);
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
