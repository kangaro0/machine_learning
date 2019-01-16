function Q = calc_Q1(x)

R = calc_R(x);
m = mean(x);

Q = R - m*m';

end