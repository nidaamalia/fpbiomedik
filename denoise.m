function denoised_signal = denoise(raw_signal)
% Dekomposisi sinyal dengan db4 level 5
[C,L] = wavedec(raw_signal,5,'db4');
cA5 = appcoef(C,L,'db4',5);
cD5 = detcoef(C,L,5);
cD4 = detcoef(C,L,4);
cD3 = detcoef(C,L,3);
cD2 = detcoef(C,L,2);
cD1 = detcoef(C,L,1);
% Thresholding otomatis
thr = ddencmp('den','wv',raw_signal);
% Thresholding setiap koefisien detail
cD5t = wthresh(cD5,'s',thr);
cD4t = wthresh(cD4,'s',thr);
cD3t = wthresh(cD3,'s',thr);
cD2t = wthresh(cD2,'s',thr);
cD1t = wthresh(cD1,'s',thr);
% Rekonstruksi sinyal
Ct = cat(1,cA5,cD5t,cD4t,cD3t,cD2t,cD1t);
denoised_signal = waverec(Ct,L,'db4');
end