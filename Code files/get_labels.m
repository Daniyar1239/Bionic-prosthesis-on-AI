function [index,labels] = get_labels(y)

%m = table2array(readtable("labels.xlsx"));
%m = table2array(readtable("labels_no4.xlsx"));
%m = table2array(readtable("labels_no4_5sess.xlsx"));
m = table2array(readtable("labels_6gest.xlsx"));
z = size(m,1)+1;
n = zeros(z,1);
n(1)=1;

for i = 2:z
    n(i) = find(y == m(i-1), 1) + n(i-1) - 1;
    y = y(n(i)-n(i-1)+1:end);
end

index= n;
m = [0; m];
labels = m;
end