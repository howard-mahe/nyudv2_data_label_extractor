clear all; clc;
addpath('utils');
mkdir('data');

% Data are extracted in :
% >> ./data/images
% >> ./data/depth
% >> ./data/rawdepth
%extract_data('nyu_depth_v2_labeled.mat');

% Data are extracted in :
% >> ./data/label04
% >> ./data/label13
% >> ./data/label40
extract_label('nyu_depth_v2_labeled.mat');