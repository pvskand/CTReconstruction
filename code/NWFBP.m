function filter = NWFBP(n)
    len = floor(n/2);
    filter = ramp(n);
    alpha = 0.001;
    for i=-len:len
        if i~=0
        w = 0.6 - 0.4 * cos((2*pi*(i + len+1))/(2*len));
        else 
            w = 1;
        end
        filter(1, i + len+1) = len*(1-(1-alpha*(w/len))) * filter(1, i + len+1);
    end
end