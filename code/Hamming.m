function filter = Hamming(n)
    
 len = floor(n/2);
    filter = ramp(n);
    size(filter)
    for i=-len:len
        filter(1, i + len+1) = (0.54 - 0.46 * cos((2*pi*(i + len+1))/(2*len))) * filter(1, i + len+1);
    end

     

end
