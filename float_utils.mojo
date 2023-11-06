from math import round

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

fn round_to(f: Float64, places: Int) raises -> Float64:
	let mult = 10 ** places
	return round(f * mult) / mult

fn print_to(f: Float64, dec_places: Int) -> String:
	# get input number as a string
	let f_str = String(f)
	# use position of the decimal point to determine the number of decimal places
	let int_places = f_str.find(".")
	# build a multiplier to shift the digits before the decimal point
	let mult = 10 ** (dec_places + 1)
	# note the use of an extra power of 10 to get the rounding digit
	# use the multiplier build the integer value of the input number
	let i = Float64(f * mult).cast[DType.int64]().to_int()
	# get the integer value as a string
	let i_str_full = String(i)
	print("i_str_full: ", i_str_full)
	# grab the last digit to be used to adjust/leave the previous digit
	let last_digit = i_str_full[len(i_str_full)-1]
	print("last_digit: ", last_digit)
	# grab the last but one digit in the integer string
	let prev_digit_pos = len(i_str_full) - 1
	var prev_digit = i_str_full[prev_digit_pos - 1]
	print("prev_digit: ", prev_digit)
	# if last digit is >= to 5 then we...
	if ord(last_digit) >= ord(5):
		# ... increment it by 1
		prev_digit = chr(ord(prev_digit) + 1)
	print("prev_digit: ", prev_digit)
	# isolate the unchanging part of integer string
	var i_str_less_2 = i_str_full[0:len(i_str_full) - 2]
	print("i_str_less_2: ", i_str_less_2)
	# grab the integer part of the output float string
	let i_str_int = i_str_full[0:int_places]
	print("i_str_int: ", i_str_int)
	# chop the integer part from the unchanging part of the number 
	i_str_less_2 = i_str_less_2[int_places:len(i_str_less_2)]
	# build the output float string
	let i_str_out = i_str_int + "." + i_str_less_2 + last_digit
	return i_str_out