---
title: Delegates
layout: page
---

From [the Squirrel documentation](http://squirrel-lang.org/squirreldoc/reference/language/delegation.html):

> Squirrel supports implicit delegation. Every table or userdata can have a parent table (delegate). A parent table is a normal table that allows the definition of special behaviors for his child. When a table (or userdata) is indexed with a key that doesn’t correspond to one of its slots, the interpreter automatically delegates the get (or set) operation to its parent.

I find the given example a little hard to understand, so here are some simpler examples:

```
t <- {};    // an initially empty table
println(t.getdelegate());     // null; no delegate by default.
```

If we attempt to read or write a non-existent slot, we get an error, as expected:

```
t <- {};
println(t.x);   // Error: the index 'x' does not exist
t.x = 42;       // Error: the index 'x' does not exist
```

If we introduce a delegate, however:

```
d <- {
    x = 99
};

t <- {};
t.setdelegate(d);
println(t.x); // 99
t.x = 101;
println(t.x); // 101
```

Note that delegates are mutable and shared:

```
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
```

By using the `<-` ("new slot"), you can stop delegating for a particular index:

```
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
```

Delegates can be nested:

```
a <- { x = 1 };

b <- {};
b.setdelegate(a);

c <- {};
c.setdelegate(b);

println(c.x);   // 1
```
