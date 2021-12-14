%������뿪��

%20200601 - ������mλ�������������λ��N(m)֮��Ĺ�ϵӦΪN(m) = floor( log2(Sum(m)+1) )��������N(m) = floor( log2(Sum(m)) )
%20200601 - ����ͼ��5bits��ʼ��

close all;
clear all;
max = 50;


F = zeros(1,max); %F(m)����m��쳲�������
Sum = zeros(1,max); %Sum(m)��mλ쳲������������ܱ�ʾ�������ֵ��111...11��
OH = zeros(1,max); %OH(m)��mλ쳲���������Ŀ���
N = zeros(1,max); %N(m)��mλ쳲������������ܱ���Ķ�����������
F(1) = 1;
F(2) = 1;
Sum(1) = 1;
Sum(2) = 2;

NewF = zeros(1,max); %F(m)����m��������
NewSum = zeros(1,max); %Sum(m)��mλ���Ǳ������ܱ�ʾ�������ֵ��111...11��
NewOH = zeros(1,max); %OH(m)��mλ���Ǳ���Ŀ���
NewN = zeros(1,max); %N(m)��mλ���Ǳ������ܱ���Ķ�����������
NewF(1) = 1;
NewF(2) = 2;
NewF(3) = 3;
NewSum(1) = 1;
NewSum(2) = 3;
NewSum(3) = 6;

IDP_Sum = zeros(1,max); %Sum(m)��mλIDP�������ܱ�ʾ�������ֵ��111...11��
IDP_OH = zeros(1,max); %OH(m)��mλIDP����Ŀ���
IDP_N = zeros(1,max); %N(m)��mλIDP�������ܱ���Ķ�����������


NB_F = zeros(1,max); %F(m)����m��NS��,Ϊ�˷������ｫNS�����ַ������У�1,2,2,4,6,10,...
NB_Sum = zeros(1,max); %Sum(m)��mλNB�������ܱ�ʾ�������ֵ��111...11��
NB_OH = zeros(1,max); %OH(m)��mλNB����Ŀ���
NB_N = zeros(1,max); %N(m)��mλNB�������ܱ���Ķ�����������
NB_F(1) = 1;
NB_F(2) = 2;
NB_F(3) = 2;
NB_Sum(1) = 1;
NB_Sum(2) = 3;
NB_Sum(3) = 5;

DPS_Sum = zeros(1,max); %Sum(m)��mλ3D-DPS�������ܱ�ʾ�������ֵ��111...11��
DPS_OH = zeros(1,max); %OH(m)��mλ3D-DPS����Ŀ���
DPS_N = zeros(1,max); %N(m)��mλ3D-DPS�������ܱ���Ķ�����������



%FNS
for i = 3:max
    F(i) = F(i-1) + F(i-2);
    Sum(i) = Sum(i-1) + F(i);
end

for i = 1:max
    N(i) = floor(log2(Sum(i)+1));   
    OH(i) = (i-N(i))/N(i);
end

%����
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
%title('���뿪���Ա�')

x2 = 1:max;
figure(2);
plot(x2,OH(x2)) 
hold on;
plot(x2,NewOH(x2))
xlabel('bit');
ylabel('overhead');
legend('Fibonacci code','This code')
%title('쳲��������뿪��')



x3 = 1:max;
figure(3);
plot(x3,NewOH(x3)) 
xlabel('����λ��');
ylabel('����');
%title('���Ǳ��뿪��')

x4 = 1:max;
figure(4);
plot(x4,IDP_OH(x4)) 
hold on;
plot(x4,NewOH(x4))
xlabel('bit');
ylabel('overhead');
legend('IDP code','This code')
%title('IDP���뿪��')

x5 = 1:max;
figure(5);
plot(x5,NB_OH(x5)) 
hold on;
plot(x5,NewOH(x5))
xlabel('bit');
ylabel('overhead');
legend('NB code','This code')
%title('NB���뿪��')

x6 = 1:max;
figure(6);
plot(x6,DPS_OH(x6)) 
hold on;
plot(x6,NewOH(x6))
xlabel('bit');
ylabel('overhead');
legend('3D-DPS code','This code')
%title('3D-DPS���뿪��')


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
%title('쳲��������뿪��')

