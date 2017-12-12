% Testing script
load('projected_head.mat');
load('head.mat');
ori = im2double(head);
and = 0.9:0.9:180;
reconstructed_img = back_projection(ct_data,and, 'none', 'bp');
figure;imshow(reconstructed_img, []);title('SIMPLE BP')

reconstructed_img = back_projection(ct_data,and, 'ramp', 'bp');
figure;imshow(reconstructed_img, []);title('RAMP FILTER')

reconstructed_img = back_projection(ct_data,and, 'hann', 'bp');
figure;imshow(reconstructed_img, []);title('HANN FILTER')

reconstructed_img = back_projection(ct_data,and, 'hamming', 'bp');
figure;imshow(reconstructed_img, []);title('HAMMING FILTER')

reconstructed_img = back_projection(ct_data,and, 'shepp_logan', 'bp');
figure;imshow(reconstructed_img, []);title('SHEPP LOGAN FILTER')

reconstructed_img = back_projection(ct_data,and, 'NWFBP', 'bp');
figure;imshow(reconstructed_img, []);title('NWFBP FILTER')
