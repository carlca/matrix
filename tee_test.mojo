# tee_test.mojo
# 
# use by: import tee_test as tt

from utils.vector import DynamicVector

var tests: DynamicVector[fn() raises -> Bool] = DynamicVector[fn() raises -> Bool]()

alias TestFn = fn() raises -> Bool 

struct TeeTest:
	var tests: DynamicVector[Pointer[TestFn]]

	fn __init__(inout self):
		self.tests = DynamicVector[Pointer[TestFn]]()

	fn add_test(inout self, func: TestFn) -> None:
		let ptr = Pointer[TestFn].alloc(1)
		ptr.store(func)
		self.tests.push_back(ptr)

	fn run_tests(self):
		self.run_tests(True)

	fn run_tests(self, fails_only: Bool):
		var fail_count = 0
		var succ_count = 0
		try:
			for i in range(self.tests.__len__()):
				let test_fn = self.tests[i].load()
				if not test_fn():
					print("test:", i + 1, "failed!")
					fail_count += 1
				else:
					succ_count += 1	
					if not fails_only:
						print("test:", i + 1, "passed!")
			print("--------------------------------------------")
			print(" Total number of tests run: ", fail_count + succ_count)
			print("    Number of tests passed: ", succ_count)
			print("    Number of tests failed: ", fail_count)
			print("--------------------------------------------")
		except:
			None
