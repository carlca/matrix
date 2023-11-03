from list import List

struct ListIter:
	var data: List
	var idx: Int

	fn __init__(inout self, data: List):
		self.idx = -1
		self.data = data

	fn __len__(self) -> Int:
		return self.data.size() - self.idx - 1 

	fn __next__(inout self) raises -> String:
		self.idx += 1
		return self.data[self.idx]
