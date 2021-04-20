x=[3,3.5,4,4.5];
y=[1.0986123,1.2527630,1.3862944,1.5040774];

function InterpolationPolynomial(x,y,value)
    A=[1,x(1),x(1)^2,x(1)^3;1,x(2),x(2)^2,x(2)^3;1,x(3),x(3)^2,x(3)^3;1,x(4),x(4)^2,x(4)^3];
    coef=inv(A)*y';
    q=poly([coef(1) coef(2) coef(3) coef(4)], "x","coeff");
    disp(q);
    disp("L(x) = " + string(horner(q,value)));
endfunction
    
