clc; clear all

dataset = load_data;

feature_vector = zeros(size(dataset,1),60);

h = waitbar(0,'Loading Data...');

for i=1:size(dataset,1)
   waitbar(i/size(dataset,1))
   time = dataset(i,:,1);
   
   %preprocess
   raw_signal = dataset(i,:,2).';   
   clean_signal = preprocessing(raw_signal);
end