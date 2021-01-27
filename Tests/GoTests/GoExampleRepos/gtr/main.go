package main
import (
    "gtr/utils"
    log "github.com/sirupsen/logrus"
    "gtr/controller"
)

func main() {
    log.WithFields(log.Fields{
        "animal": "walrus",
    }).Info("A walrus appears")

    var a00 int
    b000 := "x"
    c000, c001 := 1, 2 

    var f00 func(int, string) int

    utils.Foo()
}


func X() {
        i, y := controller.DoSthOnX(&controlller.X{})
        m := y.M[1].A.Z
}

zm := 100

func Z() {
    zm := [10]string{"x"}
    zmItem := zm[0]

    dict := map[string]controller.Y{}
    if val, ok := dict["foo"]; ok {
        //do something here
    }
}


func Z2() {
    l := &utils.Log{}
    l.Println("hello")
    l.Errorln()
}



func X2() {
        if let err := controller.DoSthOnX2(&controlller.X{}); err != nil 
	{
		a := err
		b := a
                c := b
	}
}

func X3(a, b interface{}) interface {} {
}
