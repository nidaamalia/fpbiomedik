function [normalized_feature_vector, feature_vector_mean, feature_vector_std] = normalization(feature_vector)
feature_vector_mean = mean(feature_vector);
normalized_feature_vector = feature_vector - repmat(feature_vector_mean,[size(feature_vector,1) 1]);
feature_vector_std = std(feature_vector);
normalized_feature_vector = normalized_feature_vector./repmat(feature_vector_std,[size(feature_vector,1) 1]);
normalized_feature_vector (isnan(normalized_feature_vector)) = 0;
end