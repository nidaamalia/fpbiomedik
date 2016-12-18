function [p_peak,t_peak] = pt_peak_detection(clean_signal,q_peak,s_peak)
[C,L] = wavedec(clean_signal,8,'db6');
D7 = wrcoef('d',C,L,'db6',7);
D6 = wrcoef('d',C,L,'db6',6);
e4 = D6+D7;
[~,peaks] = findpeaks(e4);
p_peak = [];
t_peak = [];
counter = 1;
i = 1;

while i<=size(peaks,1)
  if (peaks(i)>q_peak(counter))                  
      if i>1
          if q_peak(counter)-peaks(i-1)>36
              p_peak(end+1) = peaks(i-1);
              counter = counter+1;
          else
              if i>2
                  p_peak(end+1) = peaks(i-2);
                  counter = counter+1;
              else
                  counter = counter+1;
              end
          end
      else
          counter = counter+1;
      end
  else
      i = i+1;
  end
  if counter>size(q_peak,2)
      break;
  end
end
counter = 1;
i = 1;
while i<=size(peaks,1)
    if peaks (i)>s_peak(counter)
          if peaks(i)-s_peak(counter)>36
              t_peak(end+1) = peaks(i);
              counter = counter+1;
              i = i+1;
          else
              if i<size(peaks,1)
                  t_peak(end+1) = peaks(i+1);
                  i = i+2;
                  counter = counter+1;
              else
                  counter = counter+1;
                  i = i+1;
              end
          end
      else
          i = i+1;
    end
    if counter>size(s_peak,2)
        break
    end
end
end