from matrix import Matrix

fn main():
	var s: String = "[[1.1, 1.1, 1.1], [2.2, 2.2, 2.2]]"
	print(s)

	let m = Matrix(2, 3)
	s = m.trim(s, '[', ']')
	print(s)

	s = m.split(s, '], [')
	print (s)




