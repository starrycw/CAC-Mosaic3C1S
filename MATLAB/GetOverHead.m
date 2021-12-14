function [OH, CAC_OH, Bit] = GetOverHead(maxgroup)
%GETOVERHEAD: function [OH, CAC_OH, Bit] = GetOverHead(maxgroup)
%��ȡ������������OH��,���뿪����CAC_OH��,�ɴ����ԭʼ������λ��Bit
%����maxgroupΪ�������

d = 0;  %���ڼ�¼��ǰ���ȵı��룬������λΪ1ʱ���������ֵ
p = 6/7;  %���ڼ�¼��ǰ��A+B+C��ϵ֮��,Ҳ����111���������ֵ
for i = 1:1:maxgroup  %ע������i��������Ҳ����˵Z��1)�������TSV���й�ģΪ1��ʱ�ķ���������
    p = p*7;
    d = d + p;
    Bit(i) = floor(log2(d+1));
    CAC_OH(i) = (3*i)/(floor(log2(d+1))) - 1;  %��ϵ����
    X(i) = i;  
    OH(i) = 4*(CAC_OH(i)+1)/3-1;  %����������
end

end

