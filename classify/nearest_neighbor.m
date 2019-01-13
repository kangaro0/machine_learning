function [C,P] = nearest_neighbor(train,test,n,r)

dim = sqrt(size(test(:,1),1));
C = zeros(length(test(:,1)),1);
P = zeros(length(test(:,1)),1);

% Calculate distance between two points
distance = @(x1,x2,n) sum(abs((x1-x2).^n));

% Extend train cell array by 1 column for distance
train = [ train cell(size(train,1),1) ];

s = size(test,1);
% For each testing point
for i=1:s
    c = test(i,:);
    
    % For each training point
    s_t = size(train,1);
    for j=1:s_t
        ck = train{j,1}; 
        d = distance(c,ck,r);
        train{j,3} = d;
    end

    train = sortrows(train,3);
    neighbors = cell2mat(train(1:n,2));
    C(i) = mode(neighbors);
    P(i) = length(find(neighbors == C(i)))/n;
end

C = reshape(C,[dim,dim]);
P = reshape(P,[dim,dim]);

end