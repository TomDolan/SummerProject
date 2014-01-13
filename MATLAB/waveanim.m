function f = waveanim(a,b,d)
    n = 2;
    k = a;
    b1 = 1;
    b2 = 1;
    L = 1;
    %init x,y
    [x,y] = meshgrid(linspace(-4,4, 400), linspace(0,1, 100));
    
    %Y is the same for all cases
    Y = cos((n*pi)/L*y);
    
    X = real(b1*exp(i*sqrt(k^2 - (n*pi/L)^2)*x) + b2*exp(-i*sqrt(k^2 - (n*pi/L)^2)*x));
    f = X.*Y;
    plot = surf(x,y,f);
    shading interp
    %colormap bone
    axis([-3 3 0 1 -10 10])
    hold on
for j = a:d:b
    X = real(b1*exp(i*sqrt((k+j)^2 - (n*pi/L)^2)*x) + b2*exp(-i*sqrt((k+j)^2 - (n*pi/L)^2)*x));
    f = X.*Y;
    f(1) = -4
    f(0) = 4
    set(plot,'ZData',f)
    drawnow
end
end