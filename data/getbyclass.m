function D = getbyclass(data,c)

% Find indices which correspond to current class
idx = find(cell2mat(data(:,2))==c);
from = idx(1);
to = idx(end);

% Extract current class data from data
D = cell2mat(data(from:to,1));

end