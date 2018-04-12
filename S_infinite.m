function Y = S_infinite(a, b, y, x, n)

Y = a(1)*y(n-1) + a(2)*y(n-2) + a(3)*y(n-3) + b(1)*x(n) + b(2)*x(n-1) + b(3)*x(n-2);

end