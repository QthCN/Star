package main

func main(a int) {

var a func () Error

v := "outer"
fmt.Println(v)
{
    v := "inner"
    fmt.Println(v)
    {
        fmt.Println(v)
    }
}
{
    fmt.Println(v)
}
fmt.Println(v)

}
