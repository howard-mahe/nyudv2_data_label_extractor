function str = dlmwrite_cellarray(A)
[M,N] = size(A);
str = '';
for i = 1:M
    for j = 1:N
        str = [str sprintf('%s\t', A{i,j})];
    end
    str = [str sprintf('\n')];
end
end