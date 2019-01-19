function Q = calc_Q3(x,cc)

dim = size(x{1},1);
Q = zeros(dim,dim);

for i=1:cc
   xi = getbyclass(x,i);
   R = calc_R(xi);
   
   xi = cell2mat(xi(:,1)');
   m = mean(xi,2);
   
   Q = Q+R-m*m';
end
Q = Q/cc;

end