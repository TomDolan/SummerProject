function f = sumwave(L)
    n = 0;
    b1 = 1;
    b2 = 1;
    k = 1;
    %init x,y
    [x,y] = meshgrid(linspace(-4,4, 400), linspace(0,L, 100));
    
    %Y is the same for all cases
    Y = cos((n*pi)/L*y);
    
    %calculate X for the correct case of the discriminant
    X = real(b1*exp(1i*sqrt(k^2 - (n*pi/L)^2)*x) + b2*exp(-1i*sqrt(k^2 - (n*pi/L)^2)*x));
    f = X.*Y;
    %figure
    %plot = surf(x,y,f);
    %shading interp
    %colormap bone
    %axis([-4 4 0 L -10 10])
    hold on
for j = 1:100
    Y = cos((j*pi)/L*y);
    X = real(b1*exp(1i*sqrt(k^2 - (j*pi/L)^2)*x) + b2*exp(-1i*sqrt(k^2 - (j*pi/L)^2)*x));
    f = f + X.*Y;
    %X = real(b1*exp(i*sqrt((k+j)^2 - (n*pi/L)^2)*x) + b2*exp(-i*sqrt((k+j)^2 - (n*pi/L)^2)*x));
    %f = X.*Y.*exp(1i*k*j);
    %set(plot,'ZData',f)
    %drawnow
end
%figure
g = -f(2:100, :)
plot2 = surf(g)
shading interp
axis([0 400 0 100 -5 5])
%colormap summer
for j = 0:.01:10
    h = g*exp(-1i*k*j);
    set(plot2,'ZData',h)
    drawnow
end
end