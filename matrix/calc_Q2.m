function Q = calc_Q2(x,cc)

dim = size(x{1},1);
Q = zeros(dim,dim);

% For each class
for i=1:cc
    x1 = getbyclass(x,i);
    
    R = calc_R(x1);
    
    f = 1/(cc*(cc-1));
    S = zeros(dim,dim);
    for j=2:cc
        % Transform to row contain one picture
        jj = getbyclass(x,j);
        jj = cell2mat(jj(:,1)');
        
        mk = mean(jj,2);
        for k=1:j-1
            kk = getbyclass(x,k);
            kk = cell2mat(kk(:,1)');
            
            ma = mean(kk,2);
            S = S+(mk*ma'+ma*mk');
        end
    end
    S = S/f;
    
    Q = Q+R-S;
end
Q = Q/cc;


end