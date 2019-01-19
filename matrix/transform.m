function Y = transform(X,A)

rows = size(X(:,1),1);
Y = cell(rows,2);

for i=1:rows
    Y{i,1} = cell2mat(X(i,1))'*A;
    Y{i,2} = X{i,2};
end

end