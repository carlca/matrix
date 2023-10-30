fn find(s: String, sub: String) -> Int:
	let len = s.__len__()
	let sub_len = sub.__len__()
	for i in range(len - sub_len + 1):
		var is_match = True
		for j in range(sub_len):
			if s[i + j] != sub[j]:
				is_match = False
				break
		if is_match:
			return i
	return -1 

fn main() raises:
	let s = "It was the best of times"
	print(find(s, "was"))
	
	