close all;
clear all;

x1 = 3:3:33;

area_en = [ 22.08;
            154.08;
            362.880002;
            617.280004;
            992.640006;
            1249.440009;
            1860.000016;
            2415.840021;
            3060.000025;
            3791.040034;
            4300.320039]';
        
area_dec = [ 10.56;
            82.56;
            198.240001;
            348.480003;
            528.480004;
            648.960006;
            876.480007;
            1121.760011;
            1309.440014;
            1590.240016;
            1916.16002]';

power_en = [ 1.77E-03;
            4.49E-02;
            0.1838;
            0.4027;
            0.7425;
            1.0328;
            1.6888;
            2.4243;
            3.2861;
            4.3233;
            5.1622]';

power_dec = [ 3.22E-03;
            4.27E-02;
            0.1235;
            0.2413;
            0.383;
            0.4857;
            0.6902;
            0.9186;
            1.0956;
            1.3826;
            1.7357]';

% 4个编码组为一组            
d1_area_en = [  area_en(1);
                area_en(2);
                area_en(3);
                area_en(4);
                area_en(4) + area_en(1);
                area_en(4) + area_en(2);
                area_en(4) + area_en(3);
                2*area_en(4);
                2*area_en(4) + area_en(1);
                2*area_en(4) + area_en(2);
                2*area_en(4) + area_en(3)]';
            
d1_area_dec = [  area_dec(1);
                area_dec(2);
                area_dec(3);
                area_dec(4);
                area_dec(4) + area_dec(1);
                area_dec(4) + area_dec(2);
                area_dec(4) + area_dec(3);
                2*area_dec(4);
                2*area_dec(4) + area_dec(1);
                2*area_dec(4) + area_dec(2);
                2*area_dec(4) + area_dec(3)]';
            
d1_power_en = [  power_en(1);
                power_en(2);
                power_en(3);
                power_en(4);
                power_en(4) + power_en(1);
                power_en(4) + power_en(2);
                power_en(4) + power_en(3);
                2*power_en(4);
                2*power_en(4) + power_en(1);
                2*power_en(4) + power_en(2);
                2*power_en(4) + power_en(3)]';
            
d1_power_dec = [  power_dec(1);
                power_dec(2);
                power_dec(3);
                power_dec(4);
                power_dec(4) + power_dec(1);
                power_dec(4) + power_dec(2);
                power_dec(4) + power_dec(3);
                2*power_dec(4);
                2*power_dec(4) + power_dec(1);
                2*power_dec(4) + power_dec(2);
                2*power_dec(4) + power_dec(3)]';

% 3个编码组为一组            
d2_area_en = [  area_en(1);
                area_en(2);
                area_en(3);
                area_en(3) + area_en(1);
                area_en(3) + area_en(2);
                2*area_en(3);
                2*area_en(3) + area_en(1);
                2*area_en(3) + area_en(2);
                3*area_en(3);
                3*area_en(3) + area_en(1);
                3*area_en(3) + area_en(2)]';
            
d2_area_dec = [  area_dec(1);
                area_dec(2);
                area_dec(3);
                area_dec(3) + area_dec(1);
                area_dec(3) + area_dec(2);
                2*area_dec(3);
                2*area_dec(3) + area_dec(1);
                2*area_dec(3) + area_dec(2);
                3*area_dec(3);
                3*area_dec(3) + area_dec(1);
                3*area_dec(3) + area_dec(2)]';
            
d2_power_en = [  power_en(1);
                power_en(2);
                power_en(3);
                power_en(3) + power_en(1);
                power_en(3) + power_en(2);
                2*power_en(3);
                2*power_en(3) + power_en(1);
                2*power_en(3) + power_en(2);
                3*power_en(3);
                3*power_en(3) + power_en(1);
                3*power_en(3) + power_en(2)]';
            
d2_power_dec = [  power_dec(1);
                power_dec(2);
                power_dec(3);
                power_dec(3) + power_dec(1);
                power_dec(3) + power_dec(2);
                2*power_dec(3);
                2*power_dec(3) + power_dec(1);
                2*power_dec(3) + power_dec(2);
                3*power_dec(3);
                3*power_dec(3) + power_dec(1);
                3*power_dec(3) + power_dec(2)]';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
%%2个编码组为1组
%d2_area_en = [  area_en(1);
%                area_en(2);
%               area_en(2) + area_en(1);
%                2*area_en(2);
%                2*area_en(2) + area_en(1);
%                3*area_en(2);
%                3*area_en(2) + area_en(1);
%                4*area_en(2);
%                4*area_en(2) + area_en(1);
%                5*area_en(2);
%                5*area_en(2) + area_en(1)]';
%
%d2_area_dec = [  area_dec(1);
%                area_dec(2);
%                area_dec(2) + area_dec(1);
%                2*area_dec(2);
%                2*area_dec(2) + area_dec(1);
%                3*area_dec(2);
%                3*area_dec(2) + area_dec(1);
%                4*area_dec(2);
%                4*area_dec(2) + area_dec(1);
%                5*area_dec(2);
%                5*area_dec(2) + area_dec(1)]';
%            
%d2_power_en = [  power_en(1);
%                power_en(2);
%                power_en(2) + power_en(1);
%                2*power_en(2);
%                2*power_en(2) + power_en(1);
%                3*power_en(2);
%                3*power_en(2) + power_en(1);
%                4*power_en(2);
%                4*power_en(2) + power_en(1);
%                5*power_en(2);
%                5*power_en(2) + power_en(1)]';
%
%d2_power_dec = [  power_dec(1);
%                power_dec(2);
%                power_dec(2) + power_dec(1);
%                2*power_dec(2);
%                2*power_dec(2) + power_dec(1);
%                3*power_dec(2);
%                3*power_dec(2) + power_dec(1);
%                4*power_dec(2);
%                4*power_dec(2) + power_dec(1);
%                5*power_dec(2);
%                5*power_dec(2) + power_dec(1)]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%5个编码组为1组
d3_area_en = [  area_en(1);
                area_en(2);
                area_en(3);
                area_en(4);
                area_en(5);
                area_en(5) + area_en(1);
                area_en(5) + area_en(2);
                area_en(5) + area_en(3);
                area_en(5) + area_en(4);
                2*area_en(5);
                2*area_en(5) + area_en(1)]';

d3_area_dec = [  area_dec(1);
                area_dec(2);
                area_dec(3);
                area_dec(4);
                area_dec(5);
                area_dec(5) + area_dec(1);
                area_dec(5) + area_dec(2);
                area_dec(5) + area_dec(3);
                area_dec(5) + area_dec(4);
                2*area_dec(5);
                2*area_dec(5) + area_dec(1)]';
            
d3_power_en = [  power_en(1);
                power_en(2);
                power_en(3);
                power_en(4);
                power_en(5);
                power_en(5) + power_en(1);
                power_en(5) + power_en(2);
                power_en(5) + power_en(3);
                power_en(5) + power_en(4);
                2*power_en(5);
                2*power_en(5) + power_en(1)]';

d3_power_dec = [  power_dec(1);
                power_dec(2);
                power_dec(3);
                power_dec(4);
                power_dec(5);
                power_dec(5) + power_dec(1);
                power_dec(5) + power_dec(2);
                power_dec(5) + power_dec(3);
                power_dec(5) + power_dec(4);
                2*power_dec(5);
                2*power_dec(5) + power_dec(1)]';
            
            



avg_area_en = area_en ./ x1;
avg_area_dec = area_dec ./ x1;
avg_power_en = power_en ./ x1;
avg_power_dec = power_dec ./ x1;

d1_avg_area_en = d1_area_en ./ x1;
d1_avg_area_dec = d1_area_dec ./ x1;
d1_avg_power_en = d1_power_en ./ x1;
d1_avg_power_dec = d1_power_dec ./ x1;

d2_avg_area_en = d2_area_en ./ x1;
d2_avg_area_dec = d2_area_dec ./ x1;
d2_avg_power_en = d2_power_en ./ x1;
d2_avg_power_dec = d2_power_dec ./ x1;

d3_avg_area_en = d3_area_en ./ x1;
d3_avg_area_dec = d3_area_dec ./ x1;
d3_avg_power_en = d3_power_en ./ x1;
d3_avg_power_dec = d3_power_dec ./ x1;





figure(1);
plot(x1,avg_area_en,'-k.',x1,d1_avg_area_en,'--k.',x1,d2_avg_area_en,'--k.',x1,d3_avg_area_en,'--k.','LineWidth',1.3,'MarkerSize',8);
%axis([1,19,0,1])
%legend('本方案，27个冗余TSV','多路选择器方案，27个冗余TSV','信号开关方案和扩展的多路选择器方案，27个冗余TSV','本方案，36个冗余TSV','多路选择器方案，36个冗余TSV','信号开关方案和扩展的多路选择器方案，36个冗余TSV');
xlabel('codeword width')  %x轴坐标描述
ylabel('area/bit (um^2)') %y轴坐标描述
set(gca,'XTick',[3:3:33]) 
%set(gca,'YTick',[0:0.2:1]) 

figure(2);
plot(x1,avg_area_dec,'-k.',x1,d1_avg_area_dec,'--k.',x1,d2_avg_area_dec,'--k.',x1,d3_avg_area_dec,'--k.','LineWidth',1.3,'MarkerSize',8);
%axis([1,19,0,1])
%legend('本方案，27个冗余TSV','多路选择器方案，27个冗余TSV','信号开关方案和扩展的多路选择器方案，27个冗余TSV','本方案，36个冗余TSV','多路选择器方案，36个冗余TSV','信号开关方案和扩展的多路选择器方案，36个冗余TSV');
xlabel('codeword width')  %x轴坐标描述
ylabel('area/bit (um^2)') %y轴坐标描述
set(gca,'XTick',[3:3:33]) 
%set(gca,'YTick',[0:0.2:1])

figure(3);
plot(x1,avg_power_en,'-k.',x1,d1_avg_power_en,'--k.',x1,d2_avg_power_en,'--k.',x1,d3_avg_power_en,'--k.','LineWidth',1.3,'MarkerSize',8);
%axis([1,19,0,1])
%legend('本方案，27个冗余TSV','多路选择器方案，27个冗余TSV','信号开关方案和扩展的多路选择器方案，27个冗余TSV','本方案，36个冗余TSV','多路选择器方案，36个冗余TSV','信号开关方案和扩展的多路选择器方案，36个冗余TSV');
xlabel('codeword width')  %x轴坐标描述
ylabel('power/bit (mW)') %y轴坐标描述
set(gca,'XTick',[3:3:33]) 
%set(gca,'YTick',[0:0.2:1]) 

figure(4);
plot(x1,avg_power_dec,'-k.',x1,d1_avg_power_dec,'--k.',x1,d2_avg_power_dec,'--k.',x1,d3_avg_power_dec,'--k.','LineWidth',1.3,'MarkerSize',8);
%axis([1,19,0,1])
%legend('本方案，27个冗余TSV','多路选择器方案，27个冗余TSV','信号开关方案和扩展的多路选择器方案，27个冗余TSV','本方案，36个冗余TSV','多路选择器方案，36个冗余TSV','信号开关方案和扩展的多路选择器方案，36个冗余TSV');
xlabel('codeword width')  %x轴坐标描述
ylabel('power/bit (mW)') %y轴坐标描述
set(gca,'XTick',[3:3:33]) 
%set(gca,'YTick',[0:0.2:1])
