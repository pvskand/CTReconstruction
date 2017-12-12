function filter = shepp_logan(n)

    size = floor(n/2);
    for i=-size:size
        filter(1, i+size+1) = -2./(pi^2 * (4 * (i).^2 - 1) );
    end
end