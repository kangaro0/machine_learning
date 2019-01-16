function [C,P] = normal_dist(train,test,cc)

dim = sqrt(size(test(:,1),1));
C = zeros(dim,dim);
P = zeros(dim,dim);

P_a = cell(cc,1);
for i=1:cc
    P_a{i} = zeros(dim,dim);
end

% Calculate mean and covariance matrix for each class
for i=1:cc
    % Find indices which correspond to current class
    T = getbyclass(train,i);
    % Calculate mean and cov
    m = mean(T);
    C = cov(T);
    % Generate multivariate normal distribution
    nd = reshape(mvnpdf(test,m,C),[dim,dim]);
    P_a{i} = P_a{i} + nd;
end

% For each testpoint
for y=1:dim
    for x=1:dim
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