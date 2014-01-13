% Tom Dolan 16/12/2013
% timewaves.m
% creates an animation of the sum of two waves, with waveguide height L,
% eigenvalues n1 and n2
% and constants b1, b2, b3, b4

function P = timewave(n1,n2,L,b1,b2,b3,b4)
    close all
    k = 1;
    
    % init x,y arrays
    [x,y] = meshgrid(linspace(-10,10, 400), linspace(0,L, 100));
    
    % calculate X1, Y1, x2, y2 and then P
    Y1 = cos((n1*pi)/L*y);
    X1 = b1*exp(1i*sqrt(k^2 - (n1*pi/L)^2)*x) + b2*exp(-1i*sqrt(k^2 - (n1*pi/L)^2)*x);
    Y2 = cos((n2*pi)/L*y);
    X2 = b3*exp(1i*sqrt(k^2 - (n2*pi/L)^2)*x) + b4*exp(-1i*sqrt(k^2 - (n2*pi/L)^2)*x);
    P = X1.*Y1 + X2.*Y2;
    
    % plot initial wave using the real part of P
    plot = surf(x,y,real(P));
    
    % label, title etc
    xlabel('x'); ylabel('y'); title('Pressure inside the waveguide')
    shading interp
    colormap bone
    axis([-10 10 0 L -10 10])
    view([0 90]) 
    hold on
    
    % animate by recalculating P for incrementing time values
    for j = 0:.01:10
        P = (X1.*Y1 + X2.*Y2).*exp(1i*k*j);
        P(:,1) = -4*ones(100,1);
        P(:,400) = -4*ones(100,1);
        P(1,:) = -4*ones(1,400);
        P(100,:) = -4*ones(1,400);
        set(plot,'ZData',real(P))
        drawnow
    end
end