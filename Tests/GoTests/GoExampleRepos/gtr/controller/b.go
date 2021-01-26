package controller

import "gtr/uils"

type X2 struct {
	A *Y
	B int
}

type Y2 struct {
	Z string
	M map[int]*X
	M map[X2]*X
}

func DoSthOnX2(x *X2, y1 y2 Y2) (int, *Y) {
    utils.Foo()

    m := &X2{}
    _ = m.A.M[1]
}
