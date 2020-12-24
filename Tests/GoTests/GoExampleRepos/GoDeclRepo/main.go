package main


type S struct {
    x *YYY
    y, z ZZ
}

func foo(a, b int, c string) {
   x := 10
   for {
        if x < 10 {
	    fmt.Println("x")
	} else {
	    x := 10
	    y := x
	    x.x("y")
	}
   }

}

var x func(pfa int) (X, Y)

func main() {
    foo(1, 2, 3)
    v1 := 10
    foo(v1, 2, 3, x)
}
