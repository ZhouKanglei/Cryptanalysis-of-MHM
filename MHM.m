function H = MHM(b1,b2,x0,y0,len)
%% 函数功能：实现Henon map的功能
%返回值：Henon map的返回值H，H是2*len的矩阵，第1行为X向量，第2行为Y向量
%形式参数：b1,b2,x0,y0,len
%len：返回序列H的长度
%% 初始化
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