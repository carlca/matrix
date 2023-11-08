fn round_to(f: Float64, places: Int) raises -> Float64:
	let mult = 10 ** places
	return round(f * mult) / mult

