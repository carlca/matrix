fn find(s: String, sub: String) -> Int:
	return find(s, sub, 0)

fn find(s: String, sub: String, start: Int) -> Int:
	let len = s.__len__()
	let sub_len = sub.__len__()
	for i in range(start, len - sub_len + 1):
		var is_match = True
		for j in range(sub_len):
			if s[i + j] != sub[j]:
				is_match = False
				break
		if is_match:
			return i
	return -1 

fn substr(s: String, start: Int, length: Int) -> String:
	return s[start:start+length]

fn substr(s: String, start: Int) -> String:
	let length = len(s) - start
	return s[start:start+length]

fn build_string(char: String, length: Int) -> String:
	var result = String()
	for _ in range(length):
		result += char
	return result