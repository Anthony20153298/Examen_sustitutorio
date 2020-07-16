function susti()
to=0; % start time
tf=20; % end time
t=linspace(to,tf,100);
xo(1)=2; % initial condition
xo(2)=-3;
[t,x] = ode45(@(t,x)nonlinear(t,x),t,xo);
plot(t,x)
xlabel('Time (s)')
ylabel('Amplitude')
grid
function [xdot] = nonlinear(t,x)
% nonlinear model to integrate with ODE45
% parameters
a=1;
b=4.6;
k=1;
% backstepping control
u=(1/b)*(-x(2)-x(1)*a-k*(x(2)+x(1)/a)-x(1)*abs(x(1))-x(2)*abs(x(2)));
%u=0; % no control action
%xdot=[x(1)+a*sin(x(1))+x(2); % ideal system
xdot=[a*x(2); % system with uncertainty aU
x(1)*abs(x(1))+x(2)*abs(x(2))+b*u];
endfunction
endfunction