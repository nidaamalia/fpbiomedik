function clean_signal = baseremove(denoised_signal)
%avg filter 150
b = (1/150)*ones(1,150);
signal_avg = filter(b,1,denoised_signal);

%sig awal - filter
clean_signal = denoised_signal(:)-signal_avg(:);
end