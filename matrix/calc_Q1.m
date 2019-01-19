function Q = calc_Q1(x)

R = calc_R(x);

x = cell2mat(reshape(x,[size(x,2),size(x,1)]));
m = mean(x,2);

Q = R - m*m';

end