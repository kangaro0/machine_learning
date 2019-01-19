function [train,test] = load_coil20()

% Bilder laden
cd 'coil20';
list = dir('*.png');
cd '..';

files = {list.name};
n = numel(files);

train = cell(floor(n/3*2),2);
test = cell(floor(n/3),2);
t1 = 1;
t2 = 1;

for i=1:n
    name = files{i};
    
    % Klasseninformationen
    [c1,s1] = str2num(name(4));
    [c2,s2] = str2num(name(5));
    
    if s2
        c=c1*10+c2;
    else
        c=c1;
    end
    
    % Bilddaten
    data = imread(name);
    data = imresize(data,0.5);
    data = im2double(data);
    info{2} = size(data,1);
    info{3} = size(data,2);
    
    data = reshape(data,[info{2}*info{3},1]);
    
    % Aufteilung Trainings- und Testdaten
    if mod(i,3) == 0
        test{t1,1} = data;
        test{t1,2} = c;
        t1 = t1+1;
    else
        train{t2,1} = data;
        train{t2,2} = c;
        t2 = t2+1;
    end
end

% Mittelfrei machen
data = cell2mat(train(:,1));
m = mean(data);

for i=1:size(train,1)
    train{i,1} = train{i,1}-m;
end

for i=1:size(test,1)
    test{i,1} = test{i,1}-m;
end

end