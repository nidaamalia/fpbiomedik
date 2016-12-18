function clean_signal = baseremove(denoised_signal)
% Filterisasi sinyal dengan filter rata-rata dengan lebar 150
b = (1/150)*ones(1,150);
signal_avg = filter(b, 1, denoised_signal);
% Pengurangan sinyal awal dengan sinyal terfilterisasi
clean_signal = denoised_signal(:)-signal_avg(:);
end