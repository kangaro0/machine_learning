function [C,P] = parzen(train,test,cc,E)

testp = cell2mat(test(:,1));
dimX = size(testp,1);

C = zeros(dimX,1);
P = zeros(dimX,1);

% Initialize class propabilites
P_a = cell(cc,1);
for i=1:cc
    P_a{i} = P;
end

% Calculate cumulative normal distribution for each class
for i=1:cc
    c = getbyclass(train,i);
    
    for j=1:size(c,1)
        f = c{j,:};
        nd = mvnpdf(testp,f,E);
        P_a{i} = P_a{i} + nd;
    end
end

% For each testpoint
for i=1:size(testp,1)    
    p_h = 0;
    c_h = 0;
    
    for j=1:cc
        if P_a{j}(i) > p_h
            p_h = P_a{j}(i);
            c_h = j;
        end
    end
    
    P(i) = p_h;
    C(i) = c_h;
end

end