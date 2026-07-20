clear;
clc;

% Set input paths.
labelsCsvPath = '22090.csv';
gtMatPath = '22090.mat';
imagePath = '22090.jpg';

% Whether to display the boundary-recall visualization.
isDisp = true;

labels = readmatrix(labelsCsvPath);

gt = load(gtMatPath);
Seg = gt.groundTruth{1}.Segmentation;

fig_ori = imread(imagePath);

[BR_ori, BR_ins] = eval_all(labels, Seg, fig_ori, isDisp);
spNum = numel(unique(labels));

fprintf('Superpixel number: %d\n', spNum);
fprintf('BR_ori (Boundary Recall): %.6f\n', BR_ori);
fprintf('BR_ins (Instance Boundary Recall): %.6f\n', BR_ins);
