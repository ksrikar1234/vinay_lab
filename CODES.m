Exp 1
num=[100]
den=[1 10 0]
sys=tf(num,den)
[Mr,wr]=getPeakGain(sys);
Wb=bandwidth(sys)
bode(sys)
margin(sys)
grid

EXP-2
%% %% 1. 1st order system using step input
 
%% R = 41
clc;
clear;
close all;
 
s = tf('s');
G = 1/(s+41);
CG = feedback(G, 1);
figure, step(CG)
stepinfo(CG)

%% 2nd order system using step input
 
%% Under Damped
 
clc;
clear;
close all;
 
s = tf('s');
zeta = 0.5;
Wn = 30;
G = (Wn^2)/(s^2+2*s*Wn*zeta+Wn^2);
figure, step(G);
stepinfo(G)

EXP-3
clc;
clear;
close all;
s=tf('s');
G=1/(s^2+10*s+20);
figure(1)
step(G)
title('without p,pi,pid,pd controllers,511942');
 
 
% p-controller
kp=300;
C=pid(kp,0,0);
plant=C*G;
a=feedback(plant,1);
b= 0:0.01:2;
figure(2)
step(a,b)
title('step respomse with p controller,511942');
 
%pd controller
kd=10;
kp=300;
C=pid(kp,0,kd);
plant=C*G;
a1=feedback(plant,1);
b1=0:0.01:2;
figure(3);
step(a1,b1)
title('step responce with pd controller,511942');
 
 
%pi controller
kp=30;
ki=70;
C=pid(kp,ki);
plant=C*G;
a2=feedback(plant,1);
b2=0:0.01:2;
figure(4);
step(a2,b2)
title('step responce with pi controller,511942');
 
 
%pid controller
kp=350;
ki=300;
kd=50;
C=pid(kp,ki,kd);
plant=C*G;
a3=feedback(plant,1);
b3=0:0.01:2;
figure(5);
step(a3,b3)
title('step responce with pid controller,511942');
 
 
%d
kd=10;
C=pid(0,0,kd);
plant=C*G;
a4=feedback(plant,1);
b4=0:0.01:2;
figure(6);
step(a4,b4)
title('step responce with d controller,511942');
 
 
%i
ki=70;
C=pid(0,ki,0);
plant=C*G;
a5=feedback(plant,1);
b5=0:0.01:2;
figure(7);
step(a5,b5)
title('step responce with i controller,511942');
figure(8)
step(a,b);
hold on;
step(a1,b1);
hold on;
step(a2,b2);
hold on;
step(a3,b3);
hold on;
step(a4,b4);
hold on;
step(a5,b5);
hold on;

EXP-4 POLE ZERO ON STABILITY
p=[1];
q=[1 3 2 ];
G=tf(p,q);
figure(1);
step(G);
stepinfo(G);
title('step response of TF=1/(s+1)(s+2),511942');
 
p=[1];
q=[1 3 2 ];
G=tf(p,q);
t=feedback(G,1)
figure(2);
step(t);
stepinfo(t);
title('step response of negative feedback TF=1/(s+1)(s+2),511942');
 
p=[1];
q=[1 3 2 ];
G=tf(p,q);
t=feedback(G,-1)
figure(3);
step(t);
stepinfo(t);
title('step response of positive feedback TF=1/(s+1)(s+2),511942');

EXP5
BDRT
ng1=[1]; dg1=[1 0]; syssg1=tf(ng1,dg1)
ng2=[1]; dg2=[1 0]; syssg2=tf(ng2,dg2)
ng3=[1]; dg3=[1 0]; syssg3=tf(ng3,dg3)
ng4=[1]; dg4=[1 0]; syssg4=tf(ng4,dg4)
nh1=[1]; dh1=[1];sysh1=tf(nh1,dh1)
nh2=[1]; dh2=[1];sysh2=tf(nh2,dh2)
nh3=[1]; dh3=[1];sysh3=tf(nh3,dh3)
sys1=series(syssg3,syssg4)
sys2=feedback(sys1,sysh1,+1)
sys3=series(syssg2,sys2)
sys4=feedback(sys3,sysh2,-1)
sys5=series(syssg1,sys4);
sys=feedback(sys5,sysh3,-1)

--
a=input (‘Enter the values of a matrix’);
b=input(‘Enter the values of b matrix’);
c=input(‘Enter the values of c matrix’);
d=input(‘Enter the values of d matrix’);
[num,den]=SS2 tf (a,b,c,d,1)
Transfer function=tf (num,den);
---
num = input(‘Entre numerator polynomial values in the form of matrix array’);
den1=input(‘Enter denominator 1 values’);
den2=input(‘enter denominator 2 values’);
den=conv(den1,den2);
H=tf(num,den);
P=SS(H);
[a,b,c,d]=SS data(P)
-----
MatrixA = [-3 -1 0;2 0 0;0 -1 -1];
MatrixB = [1;0;1];
MatrixC = [1 0 1];
MatrixD = 0;
Qc = ctrb(MatrixA,MatrixB);
rankQc = rank(Qc);
disp('Controllable Matrix is Qc = ');
disp(Qc);
if(rankQc == rank(MatrixA))
disp('Given System is Controllable.');
else
disp('Given System is Uncontrollable');
end
Qb = obsv(MatrixA, MatrixC);
rankQb = rank(Qb);
disp('Observable Matrix is Qb = ');
disp(Qb);
if(rankQb == rank(MatrixA))
disp('Given System is Observable.');
else
disp('Given System is Unobservable');
end


EXP-6
EFFECT OF ZERO AND OPEN LOOP ON ROOT LOCUS OF CS
%% Experiment 6A
 
% transfer Function G = 36/(s^3 + 6s^2 + 11s + 6)
 
clc
clear
close all
num = 36;
den = [1 6 11 6];
G = tf(num, den);
zpk(G);
rlocus(G);
grid;
title("Root Locus of T = 36/(s^3 + 6s^2 + 11s + 6)  511942");


%% Experiment 6B
 
% transfer Function G = 36/(s^3 + 6s^2 + 11s + 6)
 
clc
clear
close all
num = 36;
den = [1 6 11 6];
G = tf(num, den);
zpk(G);
rlocus(G);
grid;
title("Root Locus of T = 36/(s^3 + 6s^2 + 11s + 6)  511942");
 
for i = 1:4
    ki = input('Enter k value: ');
    gi = feedback(G*ki, -1);
    zpk(gi);
    figure;
    rlocus(gi);
    h = "Root Locus of Tf = 36/(s^3 + 6s^2 + 11s + 6) for k = ";
    title("Root Locus of Tf = 36/(s^3 + 6s^2 + 11s + 6) for k = " + string(ki) + " 511942");
end

-
%% Experiment 6C
 
% TF = 10/(0.04*s^3 + 0.5*s^2 +s)
 
clc
clear
close all
num = 10;
den = [0.04 0.5 1 0];
G = tf(num, den);
figure, margin(G);
figure, nyquist(G);
grid, title("Nyquist plot of TF = 10/(0.04*s^3 + 0.5*s^2 +s)");
figure, rlocus(G);
grid, title("Root Locus of TF = 10/(0.04*s^3 + 0.5*s^2 +s)");



EXP-7 

LAG
clc;
clear;
close all;
s=tf('s');
GF=8/((s)*(s+1)*(1+0.2*s))
figure(1)
step(feedback(GF,1))
stepinfo(feedback(GF,1))
figure(2)
margin(GF)
[mr,wr]=getPeakGain(feedback(GF,1))
GC=(1+5*s)/(1+40*s)
G=GF*GC
figure(3)
step(feedback(G,1))
stepinfo(feedback(G,1))
figure(4)
margin(G)
[mr_cont,wr_cont]=getPeakGain(feedback(G,1))


LEAD

clc;
clear;
close all;
 
s=tf('s');
GF=10/(s^2+s)
figure(1)
step(feedback(GF,1))
stepinfo(feedback(GF,1))
figure(2)
margin(GF)
[mr,wr]=getPeakGain(feedback(GF,1))
GC=(1+0.385*s)/(1+0.162*s)
G=GF*GC
figure(3)
step(feedback(G,1))
stepinfo(feedback(G,1))
figure(4)
margin(G)
[mr_cont,wr_cont]=getPeakGain(feedback(G,1))

LAGLEAD
clc;
clear;
close all;
s=tf('s');
GF=25/((s)*(1+0.5*s)*(1+0.1*s))
figure(1)
step(feedback(GF,1))
stepinfo(feedback(GF,1))
figure(2)
margin(GF)
[mr,wr]=getPeakGain(feedback(GF,1))
GC=(1+0.746*s)/((1+16*s)*(1+0.093*s))
G=GF*GC
figure(3)
step(feedback(G,1))
stepinfo(feedback(G,1))
figure(4)
margin(G)
[mr_cont,wr_cont]=getPeakGain(feedback(G,1))


