function D = getbyclass(data,c)

% Find indices which correspond to current class
idx = find(cell2mat(data(:,2))==c);
from = idx(1);
to = idx(end);
count = to-from;

% This is better :)
D = data(from:to,:);

% % Extract current class data from data
% D = cell(count,2);
% for i=1:count
%     D(i,:) = data(i,:);
% end

end