import float_utils as fu

fn main() raises:

	let pi_str = "3.1415926"
	let pi = fu.str_to_float(pi_str)
	print(pi) # 3.1415926000000001
