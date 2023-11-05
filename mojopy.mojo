from matrix import Matrix
from python import Python
from python import PythonObject
from list import List 

import string_utils as su
import float_utils as fu

fn main() raises:

	let pi_str = "3.1415926"
	let pi = fu.str_to_float(pi_str)
	print(pi)

	let a = [[1.1, 1.1, 1.1], [2.2, 2.2, 2.2], [3.3, 3.3, 3.3], [4.4, 4.4, 4.4]] 
	print(len(a))
	print(a.get[2, ListLiteral[FloatLiteral, FloatLiteral, FloatLiteral]]())
	

	var s: String = "[[1.1, 1.1, 1.1], [2.2, 2.2, 2.2], [3.3, 3.3, 3.3], [4.4, 4.4, 4.4]]"
	# let mm = Matrix(s)
	# print("mm.print()")
	# mm.print()
	
	print("---------")

	let m = Matrix(2, 3)
	print(s)
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
	var sr = su.remove_char("['1.1, 1.1, 1.1', '2.2, 2.2, 2.2', '3.3, 3.3, 3.3', '4.4, 4.4, 4.4']", " ")
	print(sr)
	sr = su.trim(sr, "[", "]")
	print(sr)
	sr = su.trim(sr, "'", "'")
	print(sr)
	print("")	
	
	spl = su.split(sr, "','")
	
	print("Using spl.str():")
	print(spl.str())
	print("")	

	print("Using 'for sl in spl':")
	for sl in spl:
		print(sl)

	print ("It works!\n")

	print("Parsing each row:")
	let first = spl[0]
	print(first)
	print(su.count_char(first, ','))
	print("")

	
	

