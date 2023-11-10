# matrix_test.mojo
# 
# Run with: `mojo matrix_test.mojo`

from matrix import Matrix
from tee_test import TeeTest

var tests = TeeTest()

fn add_tests():
	tests.add_test(test_matrix_methods)

fn test_matrix_methods() raises -> Bool:
    let m1 = Matrix("[[1.1, 1.1, 1.1], [2.2, 2.2, 2.2], [3.3, 3.3, 3.3], [4.4, 4.4, 4.4]]")
    let m2 = Matrix("[[1.1, 1.1, 1.1], [1.1, 1.1, 1.1], [1.1, 1.1, 1.1], [1.1, 1.1, 1.1]]")
    let m3 = m1 + m2
    return m3.string_to(1) == "[[2.2, 2.2, 2.2], [3.3, 3.3, 3.3], [4.4, 4.4, 4.4], [5.5, 5.5, 5.5]]"

fn main():
	add_tests()
	tests.run_tests()
