function println(x) { print(x + "\n"); }

d <- {
    x = 99
};

t <- {};
t.setdelegate(d);
println(t.x); // 99
t.x = 101;
println(t.x); // 101
