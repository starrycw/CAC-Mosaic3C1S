%用于计算方案的tsv开销

close all;
clear all;

maxgroup = 300;
[OH, CAC_OH, Bit] = GetOverHead(maxgroup);
%1. X：tsv数目 - Y：方案能够实现的最小开销
%考虑的情况是：编码区内所有编码组排成一行，非编码区存在一行一列（即阵列始终为3行）

%1.1 不使用总线分割
for g = 1:1:maxgroup
    Datalen(g) = Bit(g) + 3 + (2 * g);  %能够传输的最长原始数据长度
    Tsvnum(g) = 3 * ((2*g) + 1);  %tsv数目
    OH_MIN(g) = (Tsvnum(g) - Datalen(g))/Datalen(g);
end

for idx = 1:1:maxgroup-2  %从3组开始
    Datalen_OHMAX(idx) = Bit(idx+2);  %能够传输的最长原始数据长度
    Tsvnum_OHMAX(idx) = 4*(idx+2);  %tsv数目
    OH_MAX(idx) = (Tsvnum_OHMAX(idx) - Datalen_OHMAX(idx))/Datalen_OHMAX(idx);
end

%1.2 使用总线分割：每组对应3个编码组
for g = 1:1:maxgroup
    G3_Segnum(g) = floor(g/3);  %分割后，完整的子段的数目
    G3_Leftnum(g) = g - (3 * G3_Segnum(g));  %分割后，最后剩余的不足以划入一个子段的组数目
    if ( G3_Leftnum(g) == 0 )
        G3_Datalen(g) = (8*G3_Segnum(g)) + 3 + (2*g);  %能够传输的最长原始数据长度
        G3_Datalen_MaxOH(g) = (8*G3_Segnum(g));  %能够传输的最长原始数据长度（无非编码区）
    else
        G3_Datalen(g) = (8*G3_Segnum(g)) + Bit(G3_Leftnum(g)) + 3 + (2*g);  %能够传输的最长原始数据长度
        G3_Datalen_MaxOH(g) = (8*G3_Segnum(g)) + Bit(G3_Leftnum(g));  %能够传输的最长原始数据长度（无非编码区）
    end

    G3_Tsvnum(g) = 3 * ((2*g) + 1);  %tsv数目
    G3_OH_MIN(g) = (G3_Tsvnum(g) - G3_Datalen(g))/G3_Datalen(g);
    
    G3_Tsvnum_MaxOH(g) = 4*g;  %tsv数目（无非编码区）
    G3_OH_MAX(g) = (G3_Tsvnum_MaxOH(g) - G3_Datalen_MaxOH(g))/G3_Datalen_MaxOH(g);
end

%1.3 使用总线分割：每组对应4个编码组
for g = 1:1:maxgroup
    G4_Segnum(g) = floor(g/4);  %分割后，完整的子段的数目
    G4_Leftnum(g) = g - (4 * G4_Segnum(g));  %分割后，最后剩余的不足以划入一个子段的组数目
    if ( G4_Leftnum(g) == 0 )
        G4_Datalen(g) = (11*G4_Segnum(g)) + 3 + (2*g);  %能够传输的最长原始数据长度
        G4_Datalen_MaxOH(g) = (11*G4_Segnum(g));  %能够传输的最长原始数据长度（无非编码区）
    else
        G4_Datalen(g) = (11*G4_Segnum(g)) + Bit(G4_Leftnum(g)) + 3 + (2*g);  %能够传输的最长原始数据长度
        G4_Datalen_MaxOH(g) = (11*G4_Segnum(g)) + Bit(G4_Leftnum(g));  %能够传输的最长原始数据长度（无非编码区）
    end

    G4_Tsvnum(g) = 3 * ((2*g) + 1);  %tsv数目
    G4_OH_MIN(g) = (G4_Tsvnum(g) - G4_Datalen(g))/G4_Datalen(g);
    
    G4_Tsvnum_MaxOH(g) = 4*g;  %tsv数目（无非编码区）
    G4_OH_MAX(g) = (G4_Tsvnum_MaxOH(g) - G4_Datalen_MaxOH(g))/G4_Datalen_MaxOH(g);
end

%1.4 使用总线分割：每组对应5个编码组
for g = 1:1:maxgroup
    G5_Segnum(g) = floor(g/5);  %分割后，完整的子段的数目
    G5_Leftnum(g) = g - (5 * G5_Segnum(g));  %分割后，最后剩余的不足以划入一个子段的组数目
    if ( G5_Leftnum(g) == 0 )
        G5_Datalen(g) = (14*G5_Segnum(g)) + 3 + (2*g);  %能够传输的最长原始数据长度
        G5_Datalen_MaxOH(g) = (14*G5_Segnum(g));  %能够传输的最长原始数据长度（无非编码区）
    else
        G5_Datalen(g) = (14*G5_Segnum(g)) + Bit(G5_Leftnum(g)) + 3 + (2*g);  %能够传输的最长原始数据长度
        G5_Datalen_MaxOH(g) = (14*G5_Segnum(g)) + Bit(G5_Leftnum(g));  %能够传输的最长原始数据长度（无非编码区）
    end

    G5_Tsvnum(g) = 3 * ((2*g) + 1);  %tsv数目
    G5_OH_MIN(g) = (G5_Tsvnum(g) - G5_Datalen(g))/G5_Datalen(g);
    
    G5_Tsvnum_MaxOH(g) = 4*g;  %tsv数目（无非编码区）
    G5_OH_MAX(g) = (G5_Tsvnum_MaxOH(g) - G5_Datalen_MaxOH(g))/G5_Datalen_MaxOH(g);
end

% 计算总线分割带来的开销增长
for g = 1:1:maxgroup
    G3_OH_MIN_INC(g) = (G3_OH_MIN(g) / OH_MIN(g))-1;
    G4_OH_MIN_INC(g) = (G4_OH_MIN(g) / OH_MIN(g))-1;
    G5_OH_MIN_INC(g) = (G5_OH_MIN(g) / OH_MIN(g))-1;    
end
for g = 1:1:2
    G3_OH_MAX_INC(g) = 0;
    G4_OH_MAX_INC(g) = 0;
    G5_OH_MAX_INC(g) = 0;    
end
for g = 3:1:maxgroup
    G3_OH_MAX_INC(g) = (G3_OH_MAX(g) / OH_MAX(g-2))-1;
    G4_OH_MAX_INC(g) = (G4_OH_MAX(g) / OH_MAX(g-2))-1;
    G5_OH_MAX_INC(g) = (G5_OH_MAX(g) / OH_MAX(g-2))-1;    
end

figure(1);
plot(Tsvnum,OH_MIN,'k');
hold on;
plot(Tsvnum,G3_OH_MIN,'r');
hold on;
plot(Tsvnum,G4_OH_MIN,'m');
%hold on;
%plot(NB_OH(x1),'g');
hold on;
plot(Tsvnum,G5_OH_MIN,'b');
xlabel('TSV number');
ylabel('Overhead');
axis([0 1200 0.22 0.29]);
%legend('0','3','4','5')

figure(2);
plot(Tsvnum,OH_MIN,'k');
hold on;
plot(Tsvnum_OHMAX,OH_MAX,'k');
xlabel('TSV number');
ylabel('Bit overhead');
axis([0 1200 0.2 0.6]);
%legend('','3','4','5')

figure(3);
plot(Tsvnum,G3_OH_MIN_INC,'k');
hold on;
plot(Tsvnum,G4_OH_MIN_INC,'k');
hold on;
plot(Tsvnum,G5_OH_MIN_INC,'k');
xlabel('TSV number');
ylabel('Growth rate of bit overhead');
axis([0 1200 0 0.3]);

figure(4);
plot(Tsvnum,G3_OH_MAX_INC,'k');
hold on;
plot(Tsvnum,G4_OH_MAX_INC,'k');
hold on;
plot(Tsvnum,G5_OH_MAX_INC,'k');
xlabel('TSV number');
ylabel('Growth rate of bit overhead');
axis([0 1200 0 0.3]);
