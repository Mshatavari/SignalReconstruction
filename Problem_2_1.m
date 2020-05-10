function root = regulafalsi(f,a,b)
i = 0;
g = 1;
tolerance = 1*10^-4;
while(g > tolerance)
    i = i + 1;
    c = a - ((f(a)*(b-a))/(f(b) - f(a)));
    if(f(c)*f(a) > 0)
        b = c;
        g = f(b);
        root = b;
    else
        a = c;
        g = f(a);
        root = a;
    end
end
end