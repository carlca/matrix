from list import List

struct Test:
	'''A simple test framework in pure Mojo.'''
	var _test_count: Int
	var _tests: DynamicVector[fn() -> None]

	fn __init__(inout self) -> None:
		self._tests = DynamicVector[fn() -> None]()

	fn add(inout self, test: fn() -> None) -> None:
		self._tests.push_back(test)


