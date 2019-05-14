function println(x) { print(x + "\n"); }

d <- {
    x = 99
};

u <- {};
v <- {};
u.setdelegate(d);
v.setdelegate(d);

println(u.x); // 99
println(v.x); // 99

u.x = 101;

println(d.x); // 101
println(u.x); // 101
println(v.x); // 101
