function interval = peak_interval(time,signal_label,peak1,peak2)
interval = [];
counter1 = 1;
while counter1<=size(signal_label,2)
    if signal_label(counter1)==peak1
        counter2 = counter1+1;
        while counter2<=size(signal_label,2)
            if signal_label(counter2)==peak1
                counter1 = counter2;
                break;
            elseif signal_label(counter2)==peak2
                interval(end+1) = time(1,counter1)-time(1,counter2);
                counter1 = counter2+1;
                break;
            else
                counter2 = counter2+1;
            end
        end
        if counter2<=size(signal_label,2)
            break;
        end
    else
            counter1 = counter1+1;
    end
end
end