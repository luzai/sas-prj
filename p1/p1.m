close all;
clc;

b = [1,5];
a = [1,2,3];
zeros = roots(b);
poles = roots(a);
plot(real(zeros),imag(zeros),'o');hold on;
plot(real(poles),imag(poles),'x');
axis([min([real(zeros);real(poles)])-2, max([real(zeros);real(poles)])+2, ...
    min([imag(zeros);imag(poles)])-2, max([imag(zeros);imag(poles)])+2 ]...
    );

plot(max(real(poles))*ones(1,10), ...
    linspace(min([imag(zeros);imag(poles)])-2, ...
                     max([imag(zeros);imag(poles)])+2, 10)...
          );



