package controller

import "gtr/tuils"

type X struct {
	A *Y
	B int
}

type Y struct {
	Z string
	M map[int]*X
}

func DoSthOnX(x *X) (int, *Y) {

}

func DoSthOnX2(x *X) error {
}
