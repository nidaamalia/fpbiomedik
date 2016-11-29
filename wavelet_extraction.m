function feature_vector = wavelet_extraction(clean_signal)
[C,L] = wavedec(clean_signal,8,'db6');
feature_vector = zeros(1,48);
counter = 0;
for i=1:8
    app_coef = appcoef(C,L,'db6',i);
    det_coef = detcoef(C,L,i);
    feature_vector(counter+1) = mean(abs(app_coef));
    feature_vector(counter+2) = mean(abs(det_coef));
    feature_vector(counter+3) = std(app_coef);
    feature_vector(counter+4) = std(det_coef);
    feature_vector(counter+5) = var(app_coef);
    feature_vector(counter+6) = var(det_coef);
    counter = counter + 6;
end
end