clc
clear all


x = [-1:0.1:1];
y = [0:0.1:1];

vl = zeros(1,11);
vl(1,1) =0.5;
vl(1,2) =1;
vl(1,3) =0.5;

l = zeros(1,11);
l(1,3) =0.5;
l(1,4) =1;
l(1,5) =0.5;

m = zeros(1,11);
m(1,5) =0.5;
m(1,6) =1;
m(1,7) =0.5;

h = zeros(1,11);
h(1,7) =0.5;
h(1,8) =1;
h(1,9) =0.5;

vh = zeros(1,11);
vh(1,9) =0.5;
vh(1,10) =1;
vh(1,11) =0.5;


figure,hold on;
xlim([0 1]),ylim([0 1]);
title('Microservices Adoption');
plot(y,vl,"color",'k',";Very Low;");
plot(y,l,"color",'g',";Low;");
plot(y,m,"color",'r',";Medium;");
plot(y,h,"color",'b',";High;");
plot(y,vh,"color",'m',";Very High;");
return 

%%%%%% Negatively High %%%%%%
nh = zeros(1,21);

nh(1,1) =0.333;
nh(1,2) =0.666;
nh(1,3) =1;
nh(1,4) =0.666;
nh(1,5) =0.333;
nh(1,6) =0;

%%%%%% Negatively Medium %%%%%%
nm = zeros(1,21);

nm(1,4) =0.333;
nm(1,5) =0.666;
nm(1,6) =1;
nm(1,7) =0.666;
nm(1,8) =0.333;

%%%%%% Negatively Low %%%%%%
nl = zeros(1,21);

nl(1,7) =0.333;
nl(1,8) =0.666;
nl(1,9) =1;
nl(1,10) =0.666;
nl(1,11) =0.333;

%%%%%% Neutral %%%%%%
n = zeros(1,21);

n(1,9) =0.333;
n(1,10) =0.666;
n(1,11) =1;
n(1,12) =0.666;
n(1,13) =0.333;
n(1,14) =0;

%%%%%% Positively Low %%%%%%
pl = zeros(1,21);

pl(1,11) =0.333;
pl(1,12) =0.666;
pl(1,13) =1;
pl(1,14) =0.666;
pl(1,15) =0.333;
pl(1,16) =0;

%%%%%% Positively Medium %%%%%%
pm = zeros(1,21);

pm(1,14) =0.333;
pm(1,15) =0.666;
pm(1,16) =1;
pm(1,17) =0.666;
pm(1,18) =0.333;
pm(1,19) =0;

%%%%%% Positively High %%%%%%
ph = zeros(1,21);

ph(1,17) =0.333;
ph(1,18) =0.666;
ph(1,19) =1;
ph(1,20) =0.666;
ph(1,21) =0.333;



figure,hold on;
xlim([-1 1]),ylim([0 1]);
title('Influence Weight');
plot(x,nh,"color",'k',";Negatively High;");
plot(x,nm,"color",'r',";Negatively Medium;");
plot(x,nl,"color",'y',";Negatively Low;");
plot(x,n,"color",'b',";Neutral;");
plot(x,pl,"color",'m',";Positively Low;");
plot(x,pm,"color",'c',";Positively Medium;");
plot(x,ph,"color",'g',";Positively High;");


