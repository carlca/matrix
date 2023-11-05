# from String import atol
import string_utils as su

fn main():
	let s = "3.1415926"
	try:
		let dot_pos = su.find(s, ".")
		let int_str = su.substr(s, 0, dot_pos)
		let enum_str = su.substr(s, dot_pos + 1)
		let enumerator = atol(enum_str)
		let denominator = atol("1" + su.build_string("0", len(enum_str)))
		let frac = enumerator / denominator
		let num = atol(int_str) + frac
		print(num)
	except:
		print("error")



