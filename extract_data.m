function extract_data(fp)
% Extract images
data_dir = fullfile('data', 'images');
mkdir(data_dir);
load(fp, 'images');
for i=1:1449
    im_name = sprintf('img_%04d.png', 5000+i);
    fname = fullfile(data_dir, im_name);
    imwrite(uint8(images(:,:,:,i)), fname);
end
clear images;

% Extract depth maps
data_dir = fullfile('data', 'depth');
mkdir(data_dir);
load(fp, 'depths');
for i=1:1449
    im_name = sprintf('img_%04d.png', 5000+i);
    fname = fullfile(data_dir, im_name);
    imwrite(uint16(depths(:,:, i)*1000), fname);
end
clear depths;

% Extract raw depth maps
data_dir = fullfile('data', 'rawdepth');
mkdir(data_dir);
load(fp, 'rawDepths');
for i=1:1449
    im_name = sprintf('img_%04d.png', 5000+i);
    fname = fullfile(data_dir, im_name);
    imwrite(uint16(rawDepths(:,:, i)*1000), fname);
end
clear rawDepths;
end