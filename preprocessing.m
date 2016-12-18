function clean_signal = preprocessing(raw_signal)
% Penghilangan noise
denoised_signal = denoise(raw_signal);
% Penghapusan simpangan garis dasar
clean_signal = baseremove(denoised_signal);
end