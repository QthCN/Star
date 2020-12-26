package main


type S1 struct {
    m1 *YYY
    m2, m3 ZZ
}

p1 := 10
p2 := 20
f1 := 30
x := 10
func f1(p1, p2 int, p3 string) {
   x := 10
   xxx, x := 1, 2
   xxx, x := 1, 2
   p1, p2, xxx, p4 := 1, 2, 3, 4
   x.member001 := 10

   for {
        if x < 10 {
	    fmt.Println("x")
	} else {
	    x = 20
	    z, x := z()
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

    for k, v := range M() {
    }
}
