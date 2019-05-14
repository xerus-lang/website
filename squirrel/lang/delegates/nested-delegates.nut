function println(x) { print(x + "\n"); }

a <- { x = 1 };

b <- {};
b.setdelegate(a);

c <- {};
c.setdelegate(b);

println(c.x);   // 1
