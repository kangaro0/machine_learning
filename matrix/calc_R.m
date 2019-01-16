function Y = calc_R( x )

dim = size(x,2);
Y = zeros(dim,dim);

n = size(x,1);
for i=1:n
    f = x(i,:);
    Y = Y + f * f';
end

Y = Y/n;

end