from matrix import Matrix
from list import list
import string_utils as su

fn main() raises:
	var s: String = "[[1.1, 1.1, 1.1], [2.2, 2.2, 2.2], [3.3, 3.3, 3.3], [4.4, 4.4, 4.4]]"
	print(s)

	print("")

	let m = Matrix(2, 3)
	s = su.trim(s, '[', ']')
	print(s)

	print("")

	print("split + str")
	var spl = su.split(s, '], [')
	print (spl.str())

	print("")

	print("split + __str__")
	spl = su.split(s, '], [')
	print (spl.__str__())

	print("")

	print("split_to_strings")
	let sps = su.split_to_strings(s, '], [')
	print (sps)

	print("")
	print("remove_spaces")
	var sr = su.remove_spaces("['1.1, 1.1, 1.1', '2.2, 2.2, 2.2', '3.3, 3.3, 3.3', '4.4, 4.4, 4.4']")
	print(sr)
	sr = su.trim(sr, "[", "]")
	print(sr)
	sr = su.trim(sr, "'", "'")
	print(sr)
	print("")	
	
	print("Using spl.str():")
	spl = su.split(sr, "','")
	print(spl.str())
	print("")	
	print("Using 'for Sl in spl':")
	
	try:
		for sl in spl:
			print(sl)
	except:
		None
	print ("It works!")