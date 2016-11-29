function [q_peak,s_peak] = qs_peak_detection(clean_signal,r_peak)
[C,L] = wavedec(clean_signal,8,'db6');
D5 = wrcoef('d',C,L,'db6',5);
D4 = wrcoef('d',C,L,'db6',4);
D3 = wrcoef('d',C,L,'db6',3);
D2 = wrcoef('d',C,L,'db6',2);
e3 = D2+D3+D4+D5;
e3diff = zeros(size(e3));
for i=3:size(e3)-2
    e3diff(i) = (-e3(i+2)+8*e3(i+1)-8*e3(i-1)+e3(i-2))/12;
end
q_peak = [];
s_peak = [];
for i=1:size(r_peak)
    idx = r_peak(i);
    for j=idx-1:-1:2
        if e3diff(j)>0 && e3diff(j-1)<=0
            q_peak(end+1) = j-1;
            break;
        end
    end
    for j=idx+1:size(clean_signal)-1
        if e3diff(j)<=0 && e3diff(j+1)>0
            s_peak(end+1) = j+1;
            break;
        end
    end
end
end