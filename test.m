addpath( 'classify' );
addpath( 'data' );
addpath( 'u9_data' );

% names = [
%     "Merkmale3_C1.mat"
%     'Merkmale3_C1.mat'
%     'Merkmale3_C1.mat'
%     'Merkmale3_C1.mat'
% ];
names = [
    "Merkmale2_C1.mat"
    'Merkmale2_C1.mat'
    'Merkmale2_C1.mat'
    'Merkmale2_C1.mat'
];
data = parse(names);

% Testdaten
[X,Y] = meshgrid(0:0.25:10,0:0.25:10);
X1 = reshape(X,[],1);
Y1 = reshape(Y,[],1);

% Trainingsdaten
% train = {
%     [ 0,-1 ], 1;
%     [ 1,0 ], 1;
%     [ 2,1 ], 1;
%     [ 3,2 ], 2;
%     [ 4,3 ], 2;
%     [ 5,4 ], 2;
%     [ 6,5 ], 3;
%     [ 7,6 ], 3;
%     [ 8,7 ], 3;
% };

[C,P] = nearest_neighbor(data,[X1,Y1],2,2);

C = reshape(C,[size(X,1),size(X,2)]);
P = reshape(P,[size(X,1),size(X,2)]);

t = cell2mat(data(:,1));

hold on;
plot(t(:,1),t(:,2),'o');
surf(X,Y,P,'FaceAlpha',0.5);





