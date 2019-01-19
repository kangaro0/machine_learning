function Y = calc_R( x )

dim = size(x{1},1);
Y = zeros(dim,dim);

% For each dataset
n = size(x,1);
for i=1:n
    f = x{i};
    Y = Y + f * f';
end

Y = Y/n;

end