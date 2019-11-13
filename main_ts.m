
clear;
close all;
clc;

Imgs_ref = tools.get_img_ref;
    % generates a reference to a set of images to be analyzed
Imgs = tools.get_imgs(Imgs_ref); % load a single image
Imgs = tools.get_footer_scale(Imgs); % get footer for selected image
imgs = {Imgs.cropped};


%-- Run thresholding for all of the images -------------------------------%
opts.bool_kmeans = 1;
opts.bool_otsu = 0;
[imgs_binary,imgs_aggs,Aggs] = ...
    agg_segment.perform_seg(Imgs,[],[],opts);
[Imgs.binary] = imgs_binary{:};


%-- Save images and labels to JPGs ------------------%
% for ii=1:length(Imgs)
%     imwrite(Imgs(ii).binary,['images/train-labels/',Imgs(ii).fname(1:end-4),'.jpg']);
%     imwrite(Imgs(ii).cropped,['images/train/',Imgs(ii).fname(1:end-4),'.jpg']);
% end

% for ii=1:length(Imgs)
%     tools.plot_aggregates(Imgs,Aggs,ii);
%     saveas(gcf,['images/kmeans/',Imgs(ii).fname(1:end-4),'.jpg']);
% end


% [Aggs_manual,Data_manual] = ...
%     pp_manual.perform_man(Aggs);


Aggs_pcm = pp.pcm(Aggs);


% Aggs_kook = pp.kook(Imgs);


% Aggs_kook_mod = pp.kook_mod(Aggs);


% load('data\data_FlareNet.mat');
% data(1).dp(1) = dp;
% data(1).dp(2) = dp;
% fname = 'sample2.json'; % json file name
% tools.write_json(fname,data); % write formatted json file

figure(1);
tools.plot_aggregates(Aggs_pcm,Imgs,1,[],[0,0,1]);

% figure(2);
% [~,~,i0] = tools.plot_binary_overlay(imgs{1},imgs_binary{1},[],[0,1,0]);

% figure(3);
% montage({i0,imgs{1}});


