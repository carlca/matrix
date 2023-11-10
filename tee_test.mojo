# tee_test.mojo
# 
# use by: import tee_test as tt

from utils.vector import DynamicVector

# var tests: DynamicVector[fn() raises -> Bool] = DynamicVector[fn() raises -> Bool]()
var tests: DynamicVector[Pointer[fn () raises -> Bool]] = DynamicVector[Pointer[fn () raises -> Bool]]()

# fn add_test(func: fn() raises -> Bool) -> None:
# 	tests.push_back(func)
fn add_test(func: fn () raises -> Bool) -> None:
    let ptr = Pointer[fn () raises -> Bool].alloc(1)
    ptr.store(func)
    tests.push_back(ptr)

# fn run_tests(fails_only: Bool):
# 	try:
# 		for i in range(tests.__len__()):
# 			if not tests[i]():
# 				print("test:", i + 1, "failed!")
# 			else:
# 				if not fails_only:
# 					print("test:", i + 1, "passed!")
# 	except:
# 		None

fn run_tests():
	run_tests(True)

fn run_tests(fails_only: Bool):
    try:
        for i in range(tests.__len__()):
            if not tests[i].load()():
                print("test:", i + 1, "failed!")
            else:
                print("test:", i + 1, "passed!")
    except:
        None