format long
rng(0);
n = 3
U = triu(rand(n,n))
X = rand(n,1)

b = U * X
xhat = U\b;
xhat - X
b - (U * xhat)

norm(b - (U*xhat))