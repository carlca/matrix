from matrix import Matrix

# write unit tests for all Matrix methods
def test_matrix_methods():
	# create a matrix
	var m = Matrix("[[1, 2], [3, 4]]")

	# test the add method
	assert m.add(Matrix.fromString("[[1, 1], [1, 1]]")).toString() == "[[2, 3], [4, 5]]"

	# test the subtract method
	assert m.subtract(Matrix.fromString("[[1, 1], [1, 1]]")).toString() == "[[0, 1], [2, 3]]"

	# test the multiply method
	assert m.multiply(Matrix.fromString("[[1, 2], [3, 4]]")).toString() == "[[7, 10], [15, 22]]"

	# test the transpose method
	assert m.transpose().toString() == "[[1, 3], [2, 4]]"

	# test the determinant method
	assert m.determinant() == -2

	# test the inverse method
	assert m.inverse().toString() == "[[-2, 1], [1.5, -0.5]]"

	# more please
	# test the format_float method from float_utils
	assert fu.format_float(3.14159, 2) == "3.14"
	assert fu.format_float(3.14159, 3) == "3.142"
	assert fu.format_float(3.14159, 4) == "3.1416"
