function Q = calc_Q2(x,cc)

dim = size(x,2);
Q = zeros(dim,dim);

% For each class
for i=1:cc
    x1 = getbyclass(x,i);
    
    R = calc_R(x1);
    
    f = 1/(cc*(cc-1));
    S = zeros(dim,dim);
    for j=2:cc
        mk = mean(getbyclass(x,j));
        for k=1:j-1
            ma = mean(getbyclass(x,k));
            S = S+(mk*ma'+ma*mk');
        end
    end
    S = S/f;
    
    Q = Q+R-S;
end
Q = Q/cc;


end