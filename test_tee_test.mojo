from tee_test import TeeTest

fn main():
	var t = TeeTest()
	t.add_test(test1)
	t.add_test(test2)
	t.add_test(test3)
	t.add_test(test4)

fn test1() raises -> Bool:
  return True

fn test2() raises -> Bool:
  return True

fn test3() raises -> Bool:
  return True

fn test4() raises -> Bool:
  return True




