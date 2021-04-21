package main;

class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!"); 
        System.out.println(args); 

        CA ca = method01(1, a, b);
        CB cb = ca.XXX();

        if (cb != ca) {
            CB cb = 100;
            CC cc = cb.yyy.zzz();
	} else {
            CB cb = 100;
            CC cc = ca.yyy.zzz();
	}
        CD cd = cb.yyy.zzz();

        {
            cb = 100;
            CB cb = 100;
            cb = 100;
        }
        CD cd = cb.yyy.zzz();
        x = var1;
    }


    private int var1;
}
