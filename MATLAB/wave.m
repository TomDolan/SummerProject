function f = wave(n, k, b1, b2)
    %init x,y
    [x,y] = meshgrid(linspace(-3,3, 300), linspace(0,1, 100));
    figure
    %Y is the same for all cases
    Y = cos(n*pi*y);
    
    %calculate X for the correct case of the discriminant
    %if (k^2 > n^2*pi^2)
    %    X = b1*exp(sqrt(k^2 - (n*pi)^2)*x) + b2*exp(-sqrt(k^2 - (n*pi)^2)*x);
    %elseif (k^2 < n^2*pi^2)
    %    X = b1*cos(sqrt((n*pi)^2 - k^2)*x) + b2*sin(sqrt((n*pi)^2 - k^2)*x);
    %else
        X = 1%b1+b2*x;
    %end
    f = X.*Y;
    plot = surf(x,y,f);
    shading interp
    axis([-3 3 0 1])
    hold on
%for j = 1:1000
%    Y = c*cos(n*pi*y)
%    X = d1*exp(sqrt((n*pi)^2 - k^2)*x) + d2*exp(-sqrt((n*pi)^2 - k^2)*x)
%    f = X.*Y;
%    set(plot,'ZData',f)
%    drawnow
%end
end