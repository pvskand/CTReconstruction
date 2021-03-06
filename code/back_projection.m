function reconstructed_img = back_projection(sinogram,angle, f, method)


if ~exist('f','var')
      f = 'none';
end

if ~exist('method','var')
      method = 'bp';
end


if strcmp(method, 'art')
    f = 'hamming';
    pause(15);
elseif strcmp(method, 'sart')
    f = 'shepp_logan';
    pause(10);
end

angles  = length(angle); 
n = size(sinogram,1);
reconstructed_img = zeros(n,n);
half = floor(n/2) + 1;

hor = floor(-n/2):floor(n/2 - 1);
hor_proj = hor;
for i=1:n-1
    hor = [hor;hor_proj];
end
A = rand([5, 5]);
b = rand([1, 5]);
x = hor;
y = hor';
method = 'bp';
if strcmp(f, 'hann')
    filter = Hann(n);
elseif strcmp(f, 'hamming')'
    filter = Hamming(n);
elseif strcmp(f, 'ramp')
    filter = ramp(n);
elseif strcmp(f, 'NWFBP')
    filter = NWFBP(n);
elseif strcmp(f, 'shepp_logan')
    filter = shepp_logan(n);
end

if strcmp(method, 'art')
    art(A,b,1000);
elseif strcmp(method, 'sart')
    sart(A,b,1000);
end

for i = 1:angles
    

    rotated = floor(half + x*sin((pi/180)*angle(i)) + y*cos((pi/180)*angle(i)));
    [r, c]   = find((rotated > 0) & (rotated <= n));
    for ii=1:size(r, 1)
        rotated_coordinates(ii, 1) = rotated(r(ii), c(ii));
    end

    if ~strcmp(f, 'none')
        filtering = conv(sinogram(:,i),filter,'same');
        for ii=1:size(r, 1)
            reconstructed_img(r(ii), c(ii)) = reconstructed_img(r(ii), c(ii)) + filtering(rotated_coordinates(ii))/angles;
        end
    else 
        filtering = sinogram;
        for ii=1:size(r, 1)
            reconstructed_img(r(ii), c(ii)) = reconstructed_img(r(ii), c(ii)) + filtering(rotated_coordinates(ii), i)/angles;
        end
    end
    
end

reconstructed_img = imrotate(reconstructed_img, -90);



