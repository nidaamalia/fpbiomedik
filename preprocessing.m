function clean_signal = preprocessing(raw_signal)

% clean noise
denoised_signal = denoise(raw_signal);

% baseremove
clean_signal = baseremove(denoised_signal);

end