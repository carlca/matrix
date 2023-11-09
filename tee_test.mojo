from utils.vector import DynamicVector

struct Test:
	'''A simple test framework in pure Mojo.'''
	var _test_count: Int
	var _tests: DynamicVector[fn() -> Bool]

	fn __init__(inout self) -> None:
		var _tests = DynamicVector[fn() -> Bool]()

	fn add(inout self, func: fn() -> Bool):
		self._tests.push_back(func)