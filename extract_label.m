function extract_label(fp)
addpath('utils/');

DEBUG_DISPLAY_13_LABELS_IMAGES = false;

% as done by Shelhamer to obtain 425x560 images
X = 41:600;
Y = 46:470;

% Handa's colormap13
colormap13 = [0,        0,          0;
              0,        0,          1;
              0.9137,   0.3490,     0.1882;
              0,        0.8549,     0;
              0.5843,   0,          0.9412;
              0.8706,   0.9451,     0.0941;
              1.0000,   0.8078,     0.8078;
              0,        0.8784,     0.8980;
              0.4157,   0.5333,     0.8000;
              0.4588,   0.1137,     0.1608;
              0.9412,   0.1373,     0.9216;
              0,        0.6549,     0.6118;
              0.9765,   0.5451,     0;
              0.8824,   0.8980,     0.7608];

load(fp, 'labels');

challenges = {'04', '13', '40'};
for c = 1:numel(challenges)
    load(fullfile('nyudv2_class_mapping', ['classMapping' challenges{c} '.mat']));
    label_dir = fullfile('data', ['label' challenges{c}]);
    mkdir(label_dir);
    for i=1:1449
        im_label = labels(Y,X,i);
        
        % substitue values
        old_label = 1:894;
        new_label = mapClass;
        [a,b] = ismember(im_label, old_label);
        im_label(a) = new_label(b(a));
        
        if DEBUG_DISPLAY_13_LABELS_IMAGES
            if strcmpi(challenges{c}, '13')
                figure(1);
                imshow(im_label, [0 str2num(challenges{c})]);
                colormap(colormap13);
                
                figure(2);
                imshow(images(Y,X,:,i));
                
                pause(1);
            end
        end
        
        % save label image
        fname = fullfile(label_dir, sprintf('img_%04d.png', 5000+i));
        imwrite(im_label, fname);
    end
    
    % save nameClass
    fid = fopen([label_dir '_className.txt'],'wt');
    fprintf(fid, dlmwrite_cellarray([strread(num2str(1:numel(className)),'%s') className']));
    fclose(fid);
end
end
