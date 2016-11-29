function [best_svm_model, best_accuracy, feature_vector_mean, feature_vector_std] = main
clc; clear all % clear

% Loading data
dataset = load_data;

feature_vector = zeros(size(dataset,1),60); % Vektor fitur
h = waitbar(0, 'Loading Data...'); % Progress bar

for i=1;size(dataset,1)
    waitbar(i/size(dataset,1))
    time = dataset(i,:,1);
    raw_signal = dataset(1,:,2).';
    % Pra-pemrosesan
    clean_signal = preprocessing(raw_signal);
    % Deteksi puncak
    [p_peak,q_peak,r_peak,s_peak,t_peak] = peak_detection(clean_signal);
    % Ekstraksi fitur
    feature_vector(i,:) = feature_extraction(clean_signal,time,p_peak,q_peak,r_peak,s_peak,t_peak);
end
close(h)

% Normalisai
[normalized_feature_vector, feature_vector_mean, feature_vector_std] = normalization(feature_vector);
%Klasifikasi dengan SVM
%[experiment_accuracy, best_svm_model, best_accuracy] = svm_classification(normalized_feature_vector);