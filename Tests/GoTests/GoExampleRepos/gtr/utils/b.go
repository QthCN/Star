package utils

import "external.com/x"

type BaseLog struct {
}

func (l *BaseLog) Errorln() {
}

type Log struct {
     BaseLog
     Backend bool `json:"backend"`

     XX x.X
     x.Z
}


func (l *Log) Println(msg String) {
}
