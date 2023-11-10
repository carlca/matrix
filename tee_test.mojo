# tee_test.mojo
# 
# use by: import tee_test as tt

from utils.vector import DynamicVector

var tests: DynamicVector[fn() raises -> Bool] = DynamicVector[fn() raises -> Bool]()

# fn add_test(func: fn() raises -> Bool) -> None:
# 	tests.push_back(func)

fn run_tests(fails_only: Bool):
	try:
		for i in range(tests.__len__()):
			if not tests[i]():
				print("test:", i + 1, "failed!")
			else:
				if not fails_only:
					print("test:", i + 1, "passed!")
	except:
		None