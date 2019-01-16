function A = calc_A(Q,dim)

if dim > size(Q,2)
    error('calc_A1: Dimension too big.');
end

[V,D] = eig(Q);
[D1,idx] = sort(diag(D),'descend');
V1 = V(:,idx);

A = V1(1:dim,:)';

end