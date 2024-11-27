%%%Q2 S2
clc;
clear;
close all;
t1=input("Enter Value end : ");
t=-3:0.01:t1;
T=input("Enter Value Of T : " );

%message signal 
m=zeros(size(t));
m(t<0)=0;
m(t<T)=0.5;
m(t>=T)=-1;

%carrier
fc=10.*T;
xc=cos(fc.*t);

% DSB
DSB=m.*xc;

%AM 
AM1=(1+(4/3).*m).*xc;
AM2=(1+(3/4).*m).*xc;

% Ploting
figure(1);
subplot(3,1,1);
plot(t,DSB);
grid on;
xlabel('t');
ylabel('DSB');

subplot(3,1,2);
plot(t,AM1);
grid on;
xlabel('t');
ylabel('AM a=4/3');

subplot(3,1,3);
plot(t,AM2);
grid on;
xlabel('t');
ylabel('AM a=3/4');

figure(2);
subplot(2,1,1)
plot(t,m,'r');
grid on;
legend('Message signal');
subplot(2,1,2);
plot(t,xc);
grid on;
legend('Carrier signal');