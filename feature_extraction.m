function feature_vector = feature_extraction(clean_signal,time,p_peak,q_peak,r_peak,s_peak,t_peak)
feature_vector = zeros(1,60);
feature_vector(1:48) = wavelet_extraction(clean_signal);
feature_vector(49:60) = morphology_extraction(clean_signal,time,p_peak,q_peak,r_peak,s_peak,t_peak);
end