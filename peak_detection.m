function [p_peak,q_peak,r_peak,s_peak,t_peak] = peak_detection(clean_signal)
% Deteksi puncak R
r_peak = r_peak_detection(clean_signal);
% Deteksi puncak Q dan S
[q_peak,s_peak] = qs_peak_detection(clean_signal,r_peak);
% Deteksi puncak P & T
[p_peak,t_peak] = pt_peak_detection(clean_signal,q_peak,s_peak);
end