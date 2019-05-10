function H = MHM(b1,b2,x0,y0,len)
%% �������ܣ�ʵ��Henon map�Ĺ���
%����ֵ��Henon map�ķ���ֵH��H��2*len�ľ��󣬵�1��ΪX��������2��ΪY����
%��ʽ������b1,b2,x0,y0,len
%len����������H�ĳ���
%% ��ʼ��
    X(1,1) = x0;
    Y(1,1) = y0; 
    for i=2:len
        X(1,i) = 1-b1*cos(X(1,i-1))-b2*Y(1,i-1);
        Y(1,i) = -X(1,i-1);
    end
    [XX,X_index] = sort(X);
    [YY,Y_index] = sort(Y);
    H = [X_index-1;Y_index-1];
end