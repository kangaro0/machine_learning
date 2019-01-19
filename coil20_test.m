clear 'all';
addpath('coil20');
addpath('matrix');
addpath('data');
addpath('classify');

[train,test] = load_coil20;

% Anzahl der Klassen
classes = cell2mat(train(:,2));
cc = length(unique(classes));

%
%   Merkmale
%

% Kernmatrix Q1
Q1 = calc_Q1(train(:,1));

% Kernmatrix Q2
Q2 = calc_Q2(train,cc);

% Kernmatrix Q3
Q3 = calc_Q3(train,cc);

% Merkmalsdimension
dim = 2;

% Transformationsmatrizen
A1 = calc_A(Q1,dim);
A2 = calc_A(Q2,dim);
A3 = calc_A(Q3,dim);

% Transformiere Daten
train = transform(train,A1);
test = transform(test,A1);

%
%   Klassifikation
%

E = [ 
    0.25,0,0;0,0.25,0;0,0,0.25 
];
[C,P]=parzen(train,test,cc,E);
