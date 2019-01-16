function Q = calc_Q3(x,cc)

dim = size(x,2);
Q = zeros(dim,dim);

for i=1:cc
   xi = getbyclass(x,i);
   
   R = calc_R(xi);
   m = mean(xi);
   
   Q = Q+R-m*m';
end
Q = Q/cc;

end