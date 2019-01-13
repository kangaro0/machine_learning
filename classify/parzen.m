function [C,P] = parzen(train,test,cc,E)

dim = sqrt(size(test(:,1),1));
C = zeros(dim,dim);
P = zeros(dim,dim);

% Initialize class distribution with 0s
P_a = cell(cc,1);
for i=1:cc
    P_a{i} = zeros(dim,dim);
end

% For each testing point
l = size(train,1);
for i=1:l
    c = train{i,:};
    ci = train{i,2};
    
    % Calculate multivariate normal distribution
    nd = reshape(mvnpdf(test,c,E),[dim,dim]);
    % Add to classdistribution
    P_a{ci} = P_a{ci} + nd;
end

% Plot class distribution
%surf(reshape(test(:,1),[dim,dim]),reshape(test(:,2),[dim,dim]),P_a{1});

% For each testpoint
X = reshape(test(:,1),[dim,dim]);
Y = reshape(test(:,2),[dim,dim]);
for y=1:dim
    for x=1:dim
        % Find highest probability
        p_h = 0;
        c_h = 0;
        for i=1:cc
            if P_a{i}(y,x) > p_h
                p_h = P_a{i}(y,x);
                c_h = i;
            end
        end
        P(y,x) = p_h;
        C(y,x) = c_h;
    end
end

end