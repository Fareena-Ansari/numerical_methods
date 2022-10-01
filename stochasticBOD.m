%%Fareena ansari
%%214104611

%%Problem 1: Stochastic BOD model using Euler- Maruyama scheme


%set the state of randn

T = 8; N = 2^8; dt = T/N;  L=N;
mean=zeros(N,1); var=zeros(N,1);
Xem = zeros(1,L);

nsim=1;
for jj=1:nsim
randn('state',100);
K1=0.5 ; sigma = 0.07; Bzero = 30; 
dW = sqrt(dt) * randn(1,N); 
W = cumsum(dW);
Btrue = Bzero*exp(-(K1)*([dt:dt:T]));
% EM steps of size Dt = R*dt
L = N; 
Btemp = Bzero;

    for j = 1:L
        Btemp = Btemp - dt*K1*Btemp + dt*0.5*sigma*sigma*Btemp - sigma*Btemp*dW(j);
        Xem(j) = Btemp;
    end
    
mean=mean+Xem'; var=var+Xem'.*Xem';
end

mean=mean/nsim; rms=sqrt(var/nsim-mean.*mean);
h=plot([0:dt:T-dt],mean,'-',[0:dt:T-dt],Btrue,'-'); set(h,'LineWidth',1);
set(gca,'FontName','Times New Roman','FontSize',12);
% title('Mean and Standard Dev. of 100 Realizations')
xlabel('Time')
ylabel('B(t)')
legend('Euler Maruyama method','Exact solution')
