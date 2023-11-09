from matrix import Matrix
import tee_test as tt

fn add_tests():
    tt.tests.push_back(test_matrix_methods)

fn test_matrix_methods() raises -> Bool:
    let m1 = Matrix("[[1.1, 1.1, 1.1], [2.2, 2.2, 2.2], [3.3, 3.3, 3.3], [4.4, 4.4, 4.4]]")
    let m2 = Matrix("[[1.1, 1.1, 1.1], [1.1, 1.1, 1.1], [1.1, 1.1, 1.1], [1.1, 1.1, 1.1]]")
    let m3 = m1 + m2
    return m3.string_to(1) == "[[2.2, 2.2, 2.2], [3.3, 3.3, 3.3], [4.4, 4.4, 4.4], [5.5, 5.5, 5.5]]"

fn main():
	add_tests()
	tt.run_tests()
