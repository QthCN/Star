package main

import (
    log "github.com/sirupsen/logrus"
    "gtr/utils"
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
