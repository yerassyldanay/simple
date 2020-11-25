package helpers

func Equal(x, y int) bool {
	return x == y
}

func EqualOrFirstGreater(x, y int) bool {
	return x >= y
}

func FirstGreater(x, y int) bool {
	return x > y
}
