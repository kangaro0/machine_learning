function data = parse(names)

cc = length(names);
data = cell( cc,2 );
off = 0;
for i=1:length(names)
    F = transpose(load(names(i),'-ascii'));
    for j=1:size(F,1)
        d = F(j,:);
        data{j+off,1} = d;
        data{j+off,2} = i;
    end
    off = off+size(F,1);
end

end