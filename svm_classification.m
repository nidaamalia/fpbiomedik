function [experiment_accuracy, best_svm_model, best_accuracy] = svm_classification(normalized_feature_vector)
%Label Dataset
positive_index = [4,7,8,9,16,17,21,22,25,27,28,30,31,33,35,38,40,41,42,43,44];
negative_index = [1,2,3,5,6,10,11,12,13,14,15,18,19,20,23,24,26,29,32,34,36,37,39,45];
label = blanks(size(normalized_feature_vector, 1));
label(positive_index) = '1';
label(negative_index) = '0';
label = cellstr(label.');

n_experiment = 50; %jumlah eksperimen
experiment_accuracy = zeros(n_experiment, 3); %akurasi seluruh eksperimen
best_svm_model = []; %model svm terbaik
best_accuracy = 0; %akurasi terbaik
h = waitbar(0, 'Training Data . . .'); %Progress bar

for experiment = 1 : n_experiment
    waitbar(experiment/n_experiment)
    %membangkitkan data training
    perm_positive = randperm(size(positive_index,2));
    perm_negative = randperm(size(negative_index,2));
    training_index = positive_index(perm_positive(1:12));
    training_index = [training_index, negative_index(perm_negative(1:14))];
    training_data = normalized_feature_vector(training_index,:);
    training_label = label(training_index);
    %melatih model-model svm
    SVMModel_linear = svmtrain(training_data, training_label, 'kernel_function','linear', 'method', 'QP', 'boxconstraint', 1);
    SVMModel_rbf = svmtrain(training_data, training_label, 'kernel_function', 'rbf', 'method', 'QP', 'rbf_sigma', 3, 'boxconstraint', 1);
    SVMModel_poly = svmtrain(training_data, training_label, 'kernel_function', 'polynomial', 'polyorder', 3, 'method', 'QP', 'boxconstraint', 1);
    %menguji model-model svm
    test_label_linear = svmclassify(SVMModel_linear, normalized_feature_vector);
    test_label_rbf = svmclassify(SVMModel_rbf, normalized_feature_vector);
    test_label_poly = svmclassify(SVMModel_poly, normalized_feature_vector);
    %perhitungan akurasi
    true_flag_linear = 0;
    true_flag_rbf = 0;
    true_flag_poly = 0;
    for i = 1 : size(normalized_feature_vector, 1)
        if ismember(test_label_linear(i),label (i))
            true_flag_linear = true_flag_linear+1;
        end
        if ismember(test_label_rbf(i),label (i))
            true_flag_rbf = true_flag_rbf+1;
        end
        if ismember(test_label_poly(i),label (i))
            true_flag_poly = true_flag_poly+1;
        end
    end
    accuracy_linear = true_flag_linear/size(normalized_feature_vector,1)*100;
    accuracy_rbf = true_flag_rbf/size(normalized_feature_vector,1)*100;
    accuracy_poly = true_flag_poly/size(normalized_feature_vector,1)*100;
    experiment_accuracy(experiment,:) = [accuracy_linear, accuracy_rbf, accuracy_poly];
    if accuracy_linear > best_accuracy
        best_accuracy = accuracy_linear;
        best_svm_model = SVMModel_linear;
    end
    if accuracy_rbf > best_accuracy
        best_accuracy = accuracy_rbf;
        best_svm_model = SVMModel_rbf;
    end
    if accuracy_poly > best_accuracy
        best_accuracy = accuracy_poly;
        best_svm_model = SVMModel_poly;
    end
end
close(h)
end
    