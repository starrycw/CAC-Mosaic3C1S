%计算编码开销

%20200601 - 更正：m位编码与二进制数位数N(m)之间的关系应为N(m) = floor( log2(Sum(m)+1) )，而不是N(m) = floor( log2(Sum(m)) )
%20200601 - 折线图从5bits开始画

close all;
clear all;
max = 50;


F = zeros(1,max); %F(m)：第m个斐波那契数
Sum = zeros(1,max); %Sum(m)：m位斐波那契编码所能表示的最大数值（111...11）
OH = zeros(1,max); %OH(m)：m位斐波那契编码的开销
N = zeros(1,max); %N(m)：m位斐波那契编码所能编码的二进制数长度
F(1) = 1;
F(2) = 1;
Sum(1) = 1;
Sum(2) = 2;

NewF = zeros(1,max); %F(m)：第m个三角数
NewSum = zeros(1,max); %Sum(m)：m位三角编码所能表示的最大数值（111...11）
NewOH = zeros(1,max); %OH(m)：m位三角编码的开销
NewN = zeros(1,max); %N(m)：m位三角编码所能编码的二进制数长度
NewF(1) = 1;
NewF(2) = 2;
NewF(3) = 3;
NewSum(1) = 1;
NewSum(2) = 3;
NewSum(3) = 6;

IDP_Sum = zeros(1,max); %Sum(m)：m位IDP编码所能表示的最大数值（111...11）
IDP_OH = zeros(1,max); %OH(m)：m位IDP编码的开销
IDP_N = zeros(1,max); %N(m)：m位IDP编码所能编码的二进制数长度


NB_F = zeros(1,max); %F(m)：第m个NS数,为了方便这里将NS数部分反向排列：1,2,2,4,6,10,...
NB_Sum = zeros(1,max); %Sum(m)：m位NB编码所能表示的最大数值（111...11）
NB_OH = zeros(1,max); %OH(m)：m位NB编码的开销
NB_N = zeros(1,max); %N(m)：m位NB编码所能编码的二进制数长度
NB_F(1) = 1;
NB_F(2) = 2;
NB_F(3) = 2;
NB_Sum(1) = 1;
NB_Sum(2) = 3;
NB_Sum(3) = 5;

DPS_Sum = zeros(1,max); %Sum(m)：m位3D-DPS编码所能表示的最大数值（111...11）
DPS_OH = zeros(1,max); %OH(m)：m位3D-DPS编码的开销
DPS_N = zeros(1,max); %N(m)：m位3D-DPS编码所能编码的二进制数长度



%FNS
for i = 3:max
    F(i) = F(i-1) + F(i-2);
    Sum(i) = Sum(i-1) + F(i);
end

for i = 1:max
    N(i) = floor(log2(Sum(i)+1));   
    OH(i) = (i-N(i))/N(i);
end

%三角
for i = 4:max
    NewF(i) = 7*NewF(i-3);
    NewSum(i) = NewSum(i-1)+NewF(i);
end

for i = 1:max
    NewN(i) = floor(log2(NewSum(i)+1));
    NewOH(i) = (i-NewN(i))/NewN(i);
end


%IDP
%IDP_Sum(1)=1;
%IDP_Sum(2)=2;
%IDP_Sum(3)=5;
%for iF = 1:1:(max-3)
%    IDP_Sum(iF+3) = Sum(iF)+F(iF+3)+F(iF+3)+F(iF+2);
%end

%for i = 1:1:max
%    IDP_N(i) = floor(log2(IDP_Sum(i)));
%    IDP_OH(i) = (i-IDP_N(i))/IDP_N(i);
%end

%IDP
for i = 3:1:max
    IDP_Sum(i) = Sum(i) - F(i-2) + F(i);
end
IDP_Sum(1) = 1;
IDP_Sum(2) = 2;

for i = 1:1:max
    IDP_N(i) = floor(log2(IDP_Sum(i)+1));
    IDP_OH(i) = (i-IDP_N(i))/IDP_N(i);
end

%NB
for i = 4:1:max
    NB_F(i) = NB_F(i-1)+NB_F(i-2);
    NB_Sum(i) = NB_Sum(i-1)+NB_F(i);
end
for i = 1:1:max
    NB_N(i) = floor(log2(NB_Sum(i)+1));
    NB_OH(i) = (i-NB_N(i))/NB_N(i);
end

%3D-DPS
DPS_Sum(1) = 1;
DPS_Sum(2) = 2;
for i = 3:1:max
    DPS_Sum(i) = Sum(i) + F(i-1);
end

for i = 1:1:max
    DPS_N(i) = floor(log2(DPS_Sum(i)+1));
    DPS_OH(i) = (i-DPS_N(i))/DPS_N(i);
end

% Code Efficiency
for i = 1:1:max
    NewOH_CE(i) = 1/(NewOH(i)+1);
    OH_CE(i) = 1/(OH(i)+1);
    IDP_OH_CE(i) = 1/(IDP_OH(i)+1);
    NB_OH_CE(i) = 1/(NB_OH(i)+1);
    DPS_OH_CE(i) = 1/(DPS_OH(i)+1);
end

x1 = 5:1:max;
figure(1);
plot(x1,NewOH(x1),'k');
hold on;
plot(x1,OH(x1),'r');
hold on;
plot(x1,IDP_OH(x1),'m');
hold on;
plot(NB_OH(x1),'g');
hold on;
plot(x1,DPS_OH(x1),'b');
xlabel('Codeword width (bit)');
ylabel('Code Efficiency');
legend('This code','FNS code','IDP code','NB code','3D-DPS code')
%legend('This code','Fibonacci code','IDP code','NB-CAC code','3D-DPS code')
%title('编码开销对比')

x2 = 1:max;
figure(2);
plot(x2,OH(x2)) 
hold on;
plot(x2,NewOH(x2))
xlabel('bit');
ylabel('overhead');
legend('Fibonacci code','This code')
%title('斐波那契编码开销')



x3 = 1:max;
figure(3);
plot(x3,NewOH(x3)) 
xlabel('编码位数');
ylabel('开销');
%title('三角编码开销')

x4 = 1:max;
figure(4);
plot(x4,IDP_OH(x4)) 
hold on;
plot(x4,NewOH(x4))
xlabel('bit');
ylabel('overhead');
legend('IDP code','This code')
%title('IDP编码开销')

x5 = 1:max;
figure(5);
plot(x5,NB_OH(x5)) 
hold on;
plot(x5,NewOH(x5))
xlabel('bit');
ylabel('overhead');
legend('NB code','This code')
%title('NB编码开销')

x6 = 1:max;
figure(6);
plot(x6,DPS_OH(x6)) 
hold on;
plot(x6,NewOH(x6))
xlabel('bit');
ylabel('overhead');
legend('3D-DPS code','This code')
%title('3D-DPS编码开销')


x1 = 5:1:max;
figure(7);
plot(x1,NewOH_CE(x1),'k');
hold on;
plot(x1,OH_CE(x1),'r');
hold on;
plot(x1,IDP_OH_CE(x1),'m');
hold on;
plot(NB_OH_CE(x1),'g');
hold on;
plot(x1,DPS_OH_CE(x1),'b');
xlabel('Code width (bit)');
ylabel('Bit efficiency');
legend('TNS-CAC','FNS-CAC','IDP-CAC','NB-CAC','3D-DPS')
%legend('TNS-CAC','FNS-CAC','IDP-CAC','NB-CAC','3D-DPS')
%title('c')

x8 = 1:max;
figure(8);
plot(x8,OH(x8)) 
xlabel('Code width (bit)');
ylabel('Bit overhead');
%title('斐波那契编码开销')

