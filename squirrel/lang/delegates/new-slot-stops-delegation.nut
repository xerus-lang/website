function println(x) { print(x + "\n"); }

d <- { x = 123 };

u <- {};
v <- {};
u.setdelegate(d);
v.setdelegate(d);

println(u.x);   // 123
println(v.x);   // 123

v.x <- 987;

println(u.x);   // 123
println(v.x);   // 987

d.x = 456;

println(u.x);   // 456
println(v.x);   // 987
