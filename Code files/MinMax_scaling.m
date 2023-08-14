function feature_norm = MinMax_scaling(feature_set, minValue, maxValue)

feature_norm = zeros(size(feature_set,1), size(feature_set,2));

for i = 1:size(feature_set,2)
    feature_norm(:,i) = (feature_set(:,i) - minValue(:,i)) / (maxValue(:,i) - minValue(:,i));
    %feature_norm(isnan(feature_norm)) = 0;
end
end