struct Matrix:
	'''Simple 2d matrix that uses Float64.'''

	var rows: Int
	var cols: Int
	var total_items: Int
	var data: Pointer[Float64]
	var debugging: Bool

	fn __init__(inout self, rows: Int, cols: Int) -> None:
		self.debugging = False
		self.rows = rows if rows > 0 else 1
		self.cols = cols if cols > 0 else 1 
		self.total_items = self.rows * self.cols
		self.data = Pointer[Float64].alloc(self.total_items) 
		for i in range(self.total_items):
			self.data.store(i, 0.0)

	fn dbg(borrowed self, msg: String, value: String) -> None:
		if self.debugging:
			print(msg, value)

	fn dbg(borrowed self, msg: String, value: Int) -> None:
		if self.debugging:
			print(msg, value)

	fn __getitem__(borrowed self, row: Int, col: Int) -> Float64:
		let index = row * self.cols + col
		if index < 0 or index >= self.total_items:
			print("Error: Index out of bounds")
			return 0.0
		return self.data.load(index)

	fn __setitem__(inout self, row: Int, col: Int, value: Float64) -> None:
		let index = row * self.cols + col
		if index < 0 or index >= self.total_items:
			print("Error: Index out of bounds")
			return
		self.data.store(index, value)

	fn __del__(owned self) -> None:
		self.data.free()	

	fn __len__(borrowed self) -> Int:
		return self.total_items

	fn __copyinit__(inout self, other: Matrix) -> None:
		self.rows = other.rows
		self.cols = other.cols
		self.total_items = other.total_items
		self.debugging = other.debugging
		self.data = Pointer[Float64].alloc(self.total_items)
		memcpy[Float64](self.data, other.data, self.total_items)

	fn __eq__ (borrowed self, other: Matrix) -> Bool:
		for i in range(self.rows):
			for j in range(self.cols):
				if self[i, j] != other[i, j]:
					return False
		return True

	fn __ne__ (borrowed self, other: Matrix) -> Bool:
		return not (self == other)

	fn __add__ (borrowed self, other: Matrix) -> Matrix:
		if self.rows != other.rows or self.cols != other.cols:
			print("Error: Matrix dimensions must match")
			return Matrix(1, 1)
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = self[i, j] + other[i, j]
		return result

	fn __iadd__ (inout self: Matrix, other: Matrix) -> None:
		self = self + other

	fn __sub__ (borrowed self, other: Matrix) -> Matrix:
		if self.rows != other.rows or self.cols != other.cols:
			print("Error: Matrix dimensions must match")
			return Matrix(1, 1)
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = self[i, j] - other[i, j]
		return result

	fn __isub__ (inout self: Matrix, other: Matrix) -> None:
		self = self - other

	fn __mul__ (borrowed self, other: Matrix) -> Matrix:
		if self.cols != other.rows:
			print("Error: Matrix dimensions must match")
			return Matrix(1, 1)
		let result = Matrix(self.rows, other.cols)
		for i in range(self.rows):
			for j in range(other.cols):
				for k in range(self.cols):
					result[i, j] += self[i, k] * other[k, j]
		return result

	fn __truediv__ (borrowed self, other: Matrix) -> Matrix:
		if self.rows != other.rows or self.cols != other.cols:
			print("Error: Matrix dimensions must match")
			return Matrix(1, 1)
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = self[i, j] / other[i, j]
		return result

	fn __add__ (borrowed self, other: Float64) -> Matrix:
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = self[i, j] + other
		return result

	fn __iadd__ (inout self: Matrix, other: Float64) -> None:
		self = self + other

	fn __sub__ (borrowed self, other: Float64) -> Matrix:
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = self[i, j] - other
		return result

	fn __isub__ (inout self: Matrix, other: Float64) -> None:
		self = self - other

	fn __mul__ (borrowed self, other: Float64) -> Matrix:
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = self[i, j] * other
		return result

	fn __imul__ (inout self: Matrix, other: Float64) -> None:
		self = self * other

	fn __truediv__ (borrowed self, other: Float64) -> Matrix:
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = self[i, j] / other
		return result

	fn __itruediv__ (inout self: Matrix, other: Float64) -> None:
		self = self / other

	fn __neg__ (borrowed self) -> Matrix:
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = -self[i, j]
		return result	

	fn apply_func [func: fn(Float64) -> Float64](borrowed self) -> Matrix:
		let result = Matrix(self.rows, self.cols)
		for i in range(self.rows):
			for j in range(self.cols):
				result[i, j] = func(self[i, j])
		return result

	fn transpose (borrowed self) -> Matrix:
		let result = Matrix(self.cols, self.rows)
		for i in range(self.rows):
			for j in range(self.cols):
				result[j, i] = self[i, j]
		return result

	fn print (borrowed self) -> None:
		print(self.get_data_as_string())

	fn get_data_as_string(borrowed self) -> String:
		var result: String = "["
		for i in range(self.rows):
			result += "["
			for j in range(self.cols):
				result += self[i, j]
				if j != self.cols - 1:
					result += ", "
			result = result + "], " if i != self.rows - 1 else result + "]"
		result = result + "]"
		return result

	fn trim(borrowed self, s: String, leading: String, trailing: String) -> String:
		var start = 0
		var end = s.__len__()
		while start < end and s[start] == leading:
			start += 1
		while end > start and s[end - 1] == trailing:
			end -= 1
		return s[start:end]

	fn find(self, s: String, sub: String, start: Int) -> Int:
		let len = s.__len__()
		let sub_len = sub.__len__()
		for i in range(start, len - sub_len + 1):
			var is_match = True
			for j in range(sub_len):
				if s[i + j] != sub[j]:
					is_match = False
					break
			if is_match:
				return i
		return -1 

	fn split(borrowed self, s: String, sep: String) -> String:
		var s1 = s
		var result = String()
		var index = self.find(s1, sep, 0)
		while index >= 0:
			result += s1[0:index] + "\n"
			s1 = s1[index + sep.__len__():s1.__len__()]
			index = self.find(s1, sep, 0)
		if s1.__len__() > 0:
			result += s1
		return result

	# fn set_data_as_string(inout self, data_string: String) -> None:
	# 	var rowStrings = self.trim(data_string, '[', ']') #.split('], [')
	# 		self.rows = rowStrings.length
	# 		self.cols = rowStrings[0].split(', ').length
	# 		self.data = Pointer(Float64).allocate(self.rows * self.cols)

	# 		for i in 0..<self.rows
	# 			var row = rowStrings[i].split(', ')
	# 			for j in 0..<self.cols
	# 				self.data[i * self.cols + j] = Float64(row[j])

	fn print_shape (borrowed self) -> None:
		print("(", self.rows, ", ", self.cols, ")")

	fn get_shape (borrowed self) -> Tuple[Int, Int]:
		return (self.rows, self.cols)

	fn get_row (borrowed self, row: Int) -> Matrix:
		let result = Matrix(1, self.cols)
		for i in range(self.cols):
			result[0, i] = self[row, i]
		return result

	fn get_col (borrowed self, col: Int) -> Matrix:
		let result = Matrix(self.rows, 1)
		for i in range(self.rows):
			result[i, 0] = self[i, col]
		return result

	fn set_row (inout self: Matrix, row: Int, other: Matrix) -> None:
		if other.rows != 1 or other.cols != self.cols:
			print("Error: Matrix dimensions must match")
			return
		for i in range(self.cols):
			self[row, i] = other[0, i]

	fn set_col (inout self: Matrix, col: Int, other: Matrix) -> None:
		if other.rows != self.rows or other.cols != 1:
			print("Error: Matrix dimensions must match")
			return
		for i in range(self.rows):
			self[i, col] = other[i, 0]

	fn get_slice (borrowed self, row_start: Int, row_end: Int, col_start: Int, col_end: Int) -> Matrix:
		if row_start < 0 or row_start >= self.rows or row_end < 0 or row_end >= self.rows or col_start < 0 or col_start >= self.cols or col_end < 0 or col_end >= self.cols:
			print("Error: Index out of bounds")
			return Matrix(1, 1)
		let result = Matrix(row_end - row_start + 1, col_end - col_start + 1)
		for i in range(row_start, row_end + 1):
			for j in range(col_start, col_end + 1):
				result[i - row_start, j - col_start] = self[i, j]
		return result

	fn set_slice (inout self: Matrix, row_start: Int, row_end: Int, col_start: Int, col_end: Int, other: Matrix) -> None:
		if row_start < 0 or row_start >= self.rows or row_end < 0 or row_end >= self.rows or col_start < 0 or col_start >= self.cols or col_end < 0 or col_end >= self.cols:
			print("Error: Index out of bounds")
			return
		if other.rows != row_end - row_start + 1 or other.cols != col_end - col_start + 1:
			print("Error: Matrix dimensions must match")
			return
		for i in range(row_start, row_end + 1):
			for j in range(col_start, col_end + 1):
				self[i, j] = other[i - row_start, j - col_start]

	fn get_slice_row (borrowed self, row_start: Int, row_end: Int) -> Matrix:
		return self.get_slice(row_start, row_end, 0, self.cols - 1)

	fn set_slice_row (inout self: Matrix, row_start: Int, row_end: Int, other: Matrix) -> None:
		self.set_slice(row_start, row_end, 0, self.cols - 1, other)

	fn get_slice_col (borrowed self, col_start: Int, col_end: Int) -> Matrix:
		return self.get_slice(0, self.rows - 1, col_start, col_end)

	fn set_slice_col (inout self: Matrix, col_start: Int, col_end: Int, other: Matrix) -> None:
		self.set_slice(0, self.rows - 1, col_start, col_end, other)	

	fn get_slice_row (borrowed self, row: Int) -> Matrix:
		return self.get_slice(row, row, 0, self.cols - 1)

	fn set_slice_row (inout self: Matrix, row: Int, other: Matrix) -> None:
		self.set_slice(row, row, 0, self.cols - 1, other)

	fn get_slice_col (borrowed self, col: Int) -> Matrix:
		return self.get_slice(0, self.rows - 1, col, col)

	fn set_slice_col (inout self: Matrix, col: Int, other: Matrix) -> None:
		self.set_slice(0, self.rows - 1, col, col, other)

	fn get_slice_row (borrowed self, row_start: Int, row_end: Int, col: Int) -> Matrix:
		return self.get_slice(row_start, row_end, col, col)

	fn set_slice_row (inout self: Matrix, row_start: Int, row_end: Int, col: Int, other: Matrix) -> None:
		self.set_slice(row_start, row_end, col, col, other)

	fn get_slice_col (borrowed self, row: Int, col_start: Int, col_end: Int) -> Matrix:
		return self.get_slice(row, row, col_start, col_end)

	fn set_slice_col (inout self: Matrix, row: Int, col_start: Int, col_end: Int, other: Matrix) -> None:
		self.set_slice(row, row, col_start, col_end, other)
