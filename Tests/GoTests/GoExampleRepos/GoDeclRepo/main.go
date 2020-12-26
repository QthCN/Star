package main

import ast "ast"
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
   x.member001 = 10

   var va int
   va = 10

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

var fx func(pfa int) (S1, Y)

func main() {
    foo(1, 2, 3)
    v1 := 10
    foo(v1, 2, 3, x)

    for rk01, v1 := range fx() {
    	go func(v1 int){
	    gov001 := v1 + rk01
	    rk01 := rk01
	}(v1)
    }
}

func (s1 *S1) S1MethodXXX() {
	s1.xxx()
	if value001, ok001 := p1[p2]; ok001 {
	    fmt.Println("%sxxx", value001)
	} else if p1 > 10 {
            ifx := value001 + 2
	} else {
            ifx := value001 + 3
	}
}

func (eeeee *DDLExec) executeCreateSequence(ssssss *ast.CreateSequenceStmt) error {
        return domain.GetDomain(eeeee.ctx).DDL().CreateSequence(eeeee.ctx, ssssss)


t := time.Now()
    switch {
    case t.Hour() < 12:
        fmt.Println("It's before noon")
    default:
        fmt.Println("It's after noon")
    }
i002 := 10
whatAmI := func(i002 interface{}) {
        switch t001 := i002.(type) {
        case bool:
            fmt.Println("I'm a bool")
        case int:
            fmt.Println("I'm an int")
        default:
            fmt.Printf("Don't know type %T\n", t001)
        }
    }
    whatAmI(true)
    whatAmI(1)
    whatAmI("hey")
}


func do(i interface{}) {
	switch v := i.(type) {
	case int:
		fmt.Printf("Twice %v is %v\n", v, v*2)
	case string:
		fmt.Printf("%q is %v bytes long\n", v, len(v))
	default:
		fmt.Printf("I don't know about type %T!\n", v)
	}
}


func fibonacci(c, quit chan int) {
	x, y := 0, 1
	for {
		select {
		case c <- x:
			x, y = y, x+y
		case <-quit:
			fmt.Println("quit")
			return
		}
	}
}

func main() {
	c := make(chan int)
	quit := make(chan int)
	go func() {
		for fi001 := 0; fi001 < 10; fi001++ {
			fmt.Println(<-c)
		}
		quit <- 0
	}()
	fibonacci(c, quit)
}

