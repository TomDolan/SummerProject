% Tom Dolan 16/12/2013
% timewave.m
% creates an animation of the series of added components to the final wave

function P = boundaries(a,b,f,g)
    %declarations
    [~, n] = size(f); L = 2000; k = 1; stop = 1.5*n; tol = .001; best = 500;
    
    %initial alpha and beta
    alpha = 0; beta = 1;
    %array of coefficients
    coefs = [exp(1i*beta*a) exp(-1i*beta*a); exp(1i*beta*b) exp(-1i*beta*b)];
    %integrate using midpoint rule
    %h = ones(n,1)*L/(n-1)
    %h(1) = h(1)/2;h(n) = h(1);
    An = 1/L*trapz(f)*L/(n-1);
    Bn = 1/L*trapz(g)*L/(n-1);
    %solve system
    bs = coefs\[An;Bn];
    
    % init x,y arrays
    [x,y] = meshgrid(linspace(a,b, 400), linspace(0,L,n));
      
    % calculate P
    P = bs(1)*exp(1i*beta*x) + bs(2)*exp(-1i*beta*x);
        
    % plot initial wave using the real part of P
    hold on
    plot = surf(x,y,real(P));
    
    % label, title etc
    xlabel('x'); ylabel('y'); title('0')
    shading interp;colormap jet;axis([a b 0 L]); %view([45 -45 70])
    
    % animate by adding on successibe terms of P and updating
    for j = 1:stop
        %pause(.05)
        %update alpha, beta and coefs
        alpha = j*pi/L;
        beta = sqrt(k-alpha^2);
        coefs = [exp(1i*beta*a) exp(-1i*beta*a); exp(1i*beta*b) exp(-1i*beta*b)];
        %recalculate An and Bn and solve system again
        An = 2/L*trapz(f.*cos(alpha*linspace(0,L,n)))*L/(n-1);
        Bn = 2/L*trapz(g.*cos(alpha*linspace(0,L,n)))*L/(n-1);
        bs = coefs\[An;Bn];
        %calculate new P
        P = P + (bs(1)*exp(1i*beta*x) + bs(2)*exp(-1i*beta*x)).*cos(alpha*y);
        %update plot
        error = [abs(P(5:n-5,1)'-f(5:n-5)) abs(P(5:n-5,400)'-g(5:n-5))];
        meanerror = mean(error);
        if(meanerror<best)
            set(plot,'ZData',real(P));
            drawnow
            title(j);
            best = meanerror;
        end
        if(meanerror<tol)
            7
            break
        end
        
    end
    %for j = 0:.01:10
    %    P2 = P.*exp(1i*k*j);
    %    set(plot,'ZData',real(P2))
    %    drawnow
    %end
end