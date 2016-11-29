function feature_vector = morphology_extraction(clean_signal,time,p_peak,q_peak,r_peak,s_peak,t_peak)
feature_vector = zeros(1,12);
signal_label = blank(size(clean_signal,1);
signal_label(:) = 'o';
signal_label(p_peak) = 'p';
signal_label(q_peak) = 'q';
signal_label(r_peak) = 'r';
signal_label(s_peak) = 's';
signal_label(t_peak) = 't';
% Standar deviasi R-R
rr_interval =  zeros(1,size(r_peak,1)-1);
for i=1:size(rr_interval,2)
    rr_interval(1,i) = time(r_peak(i+1))-time(r_peak(i));
end
feature_vector(1) = std(rr_interval);
% Standar deviasi P-R
pr_interval = peak_interval(time,signal_label,'p','r');
feature_vector(2) = std(pr_interval);
% Standar deviasi P-T
pt_interval = peak_interval(time,signal_label,'p','t');
feature_vector(3) = std(pt_interval);
% Standar deviasi S-T
st_interval = peak_interval(time,signal_label,'s','t');
feature_vector(4) = std(st_interval);
% Standar deviasi T-T
tt_interval = zeros(1,size(t_peak,2)-1);
for i=1:size(tt_interval,2)
    tt_interval(1,i) = time(t_peak(1,i+1))-time(1,r_peak(i));
end
feature_vector(5) = std(tt_interval);
% Standar deviasi Q-T
qt_interval = peak_interval(time,signal_label,'q','t');
feature_vector(6) = std(qt_interval);
% Nilai maksimum
feature_vector(7) = max(clean_signal(p_peak));
feature_vector(8) = max(clean_signal(q_peak));
feature_vector(9) = max(clean_signal(r_peak));
feature_vector(10) = max(clean_signal(s_peak));
feature_vector(11) = max(clean_signal(t_peak));
% Jumlah puncak R
feature_vector(12) = size(r_peak,1);
end