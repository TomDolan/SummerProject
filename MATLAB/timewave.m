% Tom Dolan 16/12/2013
% timewave.m
% creates an animation of the wave, with waveguide height L, eigenvalue n
% and constants b1, b2

function P = timewave(n,L,b1,b2)
    %close all
    k = 1;
    
    % init x,y arrays
    [x,y] = meshgrid(linspace(-10,10, 400), linspace(0,L, 100));
    
    % calculate X, Y and then P
    Y = cos((n*pi)/L*y);
    X = b1*exp(1i*sqrt(k^2 - (n*pi/L)^2)*x) + b2*exp(-1i*sqrt(k^2 - (n*pi/L)^2)*x);
    %P1 = b1*exp(1i*sqrt(k^2 - (n*pi/L)^2)*x + 1i*(n*pi)/L*y);
    %P2 = b1*exp(1i*sqrt(k^2 - (n*pi/L)^2)*x - 1i*(n*pi)/L*y);
    P = X.*Y;
    
    % plot initial wave using the real part of P
    hold on
    %plot1= surf(x,y,real(P1)-3)
    %plot2= surf(x,y,real(P2)-6)
    plot = surf(x,y,real(P));
    
    % label, title etc
    xlabel('x'); ylabel('y'); title('Pressure inside the waveguide')
    shading interp
    colormap jet
    axis([-10 10 0 L -5 5])
    view([0 90])
    hold on
    
    % animate by recalculating P for incrementing time values
    for j = 0:.01:10
        P = X.*Y.*exp(1i*k*j);
        set(plot,'ZData',real(P))
        %P3 = P1.*exp(1i*k*j); 
        %set(plot1,'ZData',real(P3)-3)
        %P4 = P2.*exp(1i*k*j);
        %set(plot2,'ZData',real(P4)-6)
        drawnow
    end
end