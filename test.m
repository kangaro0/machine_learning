addpath( 'classify' );
addpath( 'data' );
addpath( 'u9_data' );

% names = [
%     "Merkmale3_C1.mat"
%     'Merkmale3_C2.mat'
%     'Merkmale3_C3.mat'
%     'Merkmale3_C4.mat'
% ];
names = [
    "Merkmale2_C1.mat"
    'Merkmale2_C2.mat'
    'Merkmale2_C3.mat'
    'Merkmale2_C4.mat'
];
data = parse(names);

% Testdaten
[X,Y] = meshgrid(0:0.25:15,0:0.25:15);
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

[C,P] = nearest_neighbor(data,[X1,Y1],3,2);

C = reshape(C,[size(X,1),size(X,2)]);
P = reshape(P,[size(X,1),size(X,2)]);

colors = [ 
    0.5,0,0;
    0.6,0.39,0.14;
    0.5,0.5,0;
    0.9,0.098,0.29;
    0.96,0.51,0.19
];

% Generate Colors
Col = zeros(size(C,1),size(C,2),3);
for y=1:size(C,1)
    for x=1:size(C,2)
        c = C(x,y);
        Col(x,y,1) = colors(c,1);
        Col(x,y,2) = colors(c,2);
        Col(x,y,3) = colors(c,3);
    end
end

hold on;
t = cell2mat(data(:,1));
plot(t(:,1),t(:,2),'o');
surf(X,Y,P,Col,'FaceAlpha',0.5);





