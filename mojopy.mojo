from matrix import Matrix
from list import list
import string_utils as su

fn main() raises:
	var s: String = "[[1.1, 1.1, 1.1], [2.2, 2.2, 2.2], [3.3, 3.3, 3.3], [4.4, 4.4, 4.4]]]"
	print(s)

	print("")

	let m = Matrix(2, 3)
	s = su.trim(s, '[', ']')
	print(s)

	print("")

	print("split_to_list + str")
	var spl = su.split_to_list(s, '], [')
	print (spl.str())

	print("")

	print("split_to_list + __str__")
	spl = su.split_to_list(s, '], [')
	print (spl.__str__())

	print("")

	print("split")
	let sps = su.split(s, '], [')
	print (sps)

	print("")

	var l: list[String] = list[String]()
	l.append("A")
	l.append("B")
	l.append("C")
	l.append("D")
	print(l.__str__())
	

	




