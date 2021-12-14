function [OH, CAC_OH, Bit] = GetOverHead(maxgroup)
%GETOVERHEAD: function [OH, CAC_OH, Bit] = GetOverHead(maxgroup)
%获取编码区开销（OH）,编码开销（CAC_OH）,可传输的原始二进制位数Bit
%其中maxgroup为最大组数

d = 0;  %用于记录当前长度的编码，当所有位为1时，所代表的值
p = 6/7;  %用于记录当前组A+B+C数系之和,也即“111”所代表的值
for i = 1:1:maxgroup  %注意这里i是组数，也就是说Z（1)代表的是TSV阵列规模为1组时的方案开销。
    p = p*7;
    d = d + p;
    Bit(i) = floor(log2(d+1));
    CAC_OH(i) = (3*i)/(floor(log2(d+1))) - 1;  %数系开销
    X(i) = i;  
    OH(i) = 4*(CAC_OH(i)+1)/3-1;  %编码区开销
end

end

