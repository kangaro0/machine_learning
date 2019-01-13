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
cc = length(names);

% Testgrid
[X,Y] = meshgrid(0:0.25:15,0:0.25:15);

%
% Classification
%
% Nearest Neighbor
%[C,P] = nearest_neighbor(data,[X(:) Y(:)],5,2);
% Parzen
%E = [ 0.25,0;0,0.25 ];
%[C,P] = parzen(data,[X(:) Y(:)],cc,E);
% Normal distribution
[C,P] = normal_dist(data,[X(:) Y(:)],cc);

% Generate colors
Col = generate_colors(C);

hold on;
t = cell2mat(data(:,1));
plot(t(:,1),t(:,2),'o');
surf(X,Y,P,Col,'FaceAlpha',0.5);





