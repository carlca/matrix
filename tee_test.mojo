from utils.vector import DynamicVector

var tests: DynamicVector[fn() raises -> Bool] = DynamicVector[fn() raises -> Bool]()

fn run_tests():
	try:
		for i in range(tests.__len__()):
			if not tests[i]():
				print("test:", i + 1, "failed!")
			else:
				print("test:", i + 1, "passed!")
	except:
		None