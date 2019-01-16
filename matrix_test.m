addpath('data');
addpath('matrix');

train1 = [
    1,2;
    2,3;
    3,4;
];

train2 = [
    4,5;
    5,6;
    6,7
];

train = {
    train1,1;
    train2,2;
}

R = calc_R(train1);
Q1 = calc_Q1(train1);
Q2 = calc_Q2(train,2);
Q3 = calc_Q3(train,2);
A1 = calc_A(Q1,1);
A2 = calc_A(Q2,1);
A3 = calc_A(Q3,1);