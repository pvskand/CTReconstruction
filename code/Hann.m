function filter = Hann(n)
     len = floor(n/2);
    filter = ramp(n);

     filter = hann(n+1)'.*filter;
end