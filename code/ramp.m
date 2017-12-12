function filter = ramp(n)
    size = floor(n/2);
    
    filter = zeros(1,size);
    filter_rev = zeros(1,size);
    for i=1:2:size
        
       filter(1, i) = -1./((i* pi)^2); 
    end
    for i=1:size
        
       filter_rev(1, size-i+1) = filter(1, i);
    end
    
    filter = [filter_rev 1/4 filter];

end