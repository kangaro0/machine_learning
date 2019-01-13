function y = parzen(train,test,E)

% Extend train cell array by 1 column for distance
train = [ train cell(size(train,1),1) ];

s = size(test,1);
% For each testing point
for i=1:s
    c = test(i,:);
    
    for j=1:size(train,1)
        ck = train{j,1};
        
        
    end
    
end