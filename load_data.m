function dataset = load_data()

addpath(strcat(pwd,'\\wfdb-app-toolbox-0-9-9\\mcode\\'));
files = dir('Dataset/tmp/*.mat');
dataset = zeros(size(files,1),21600,2);

for i=1:size(files,1)
    file_name = strcat('Dataset/tmp/',files(i).name);
    [tm,sig] = rdmat(file_name(1:end-4));
    dataset(i,:,:) = [tm.',sig(:,1)];
end