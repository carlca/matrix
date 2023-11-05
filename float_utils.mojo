fn str_to_float(s: String) raises -> Float64:
	try:
		let dot_pos = s.find(".") 
		let int_str = s[0:dot_pos]
		let num_str = s[dot_pos+1:len(s)]
		let numerator = atol(num_str)
		var denom_str = String()
		for _ in range(len(num_str)):
			denom_str += "0"
		let denominator = atol("1" + denom_str)
		let frac = numerator / denominator
		return atol(int_str) + frac
	except:
		print("error in str_to_float")
		return 0.0

