function r_peak = r_peak_detection(clean_signal)
[C,L] = wavedec(clean_signal,8,'db6');
D5 = wrcoef('d',C,L,'db6',5);
D4 = wrcoef('d',C,L,'db6',4);
D3 = wrcoef('d',C,L,'db6',3);
e1 = D3+D4+D5;
e2 = (D4.*(D3+D5));
ee = (e1.*e2)./(2^8);
thr = 0.01*max(ee);
for i=1:size(ee)
    if ee(i)<thr
        ee(i)=0;
    end
end
[~,r_peak] = findpeaks(ee,'MinPeakDistance',72);
end