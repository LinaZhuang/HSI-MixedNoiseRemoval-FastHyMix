%% Name: Demo_FastHyMix
%
%  Generate the denoising results of FastHyMix reported the paper:
%
%   [1] Lina Zhuang and Michael K. Ng, “FastHyMix: Fast and 
%       Parameter-free Hyperspectral Image Mixed Noise Removal”, IEEE 
%       Transactions on Neural Networks and Learning Systems, 2021.
%       DOI: 10.1109/TNNLS.2021.3112577 
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IMPORTANT NOTE:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%      This script uses the package BM3D  (v2 (30 January 2014))
%      to implement the denoising algorithm BM3D introduced in
%
%      K. Dabov, A. Foi, V. Katkovnik, and K. Egiazarian, "Image denoising by
%      sparse 3D transform-domain collaborative filtering," IEEE Trans.
%      Image Process., vol. 16, no. 8, pp. 2080-2095, August 2007.
%
%      The BM3D package  is available at the
%      BM3D web page:  http://www.cs.tut.fi/~foi/GCF-BM3D
%
%      Download this package and install it is the folder /BM3D
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author: Lina Zhuang (linazhuang@qq.com)
%         Nov. 2021
%%



clear;clc;close all;
addpath('scripts');
% Q: How to run the different set of parameters?
% A: dataset              'Pavia' - Pavia image;
%                         'DC' - DC image.
%    case_num             '1' - non i.i.d. Guassian noise;
%                         '2' - non i.i.d. Guassian noise + stripes;
%                         '3' - non i.i.d. Guassian noise + salt&pepper noise;
%                         '4' - non i.i.d. Guassian noise + stripes + salt&pepper noise
%
% USAGE EXAMPLES:
% case_num = 4;  
% dataset ='Pavia' ;
% %--------------------------
% case_num = 1;
% dataset ='DC';
% %--------------------------


dataset ='Pavia'; 
case_num= 4;
 

    switch case_num      
        case 1  % non i.i.d. Guassian noise
            k_subspace = 8;
            k = 233;
            stripes = 0;
            impulse = 0;
            impluse_ratio = 0.1;
            noise_simulation_Gaussian_FastHyMix;   % use the script to simulate the synthetic noise
        case 2  % non i.i.d. Guassian noise + stripes
            k_subspace = 8;
            k = 233;
            stripes = 1;  
            impulse = 0;
            impluse_ratio = 0.1;
            noise_simulation_Gaussian_FastHyMix;   % use the script to simulate the synthetic noise
        case 3  % non i.i.d. Guassian noise + salt&pepper noise
            k_subspace = 8;
            k = 233;
            stripes = 0;
            impulse = 1;
             switch dataset
                case 'DC'
                    impluse_ratio = 0.001;
                case 'Pavia'
                    impluse_ratio = 0.005;
            end
            noise_simulation_Gaussian_FastHyMix;   % use the script to simulate the synthetic noise
        case 4  % non i.i.d. Guassian noise + stripes + salt&pepper noise
            k_subspace = 8;
            k = 233;
            stripes = 1;
            impulse = 1;
           switch dataset
                case 'DC'
                    impluse_ratio = 0.001;
                case 'Pavia'
                    impluse_ratio = 0.005;
            end
            noise_simulation_Gaussian_FastHyMix;   % use the script to simulate the synthetic noise
       
    end
 
    
    %--------- Compute the quantitive assement indexes of the noisy HSI -------------
    num = 1;
    disp('*********************** noisy ************************');
    [MPSNR(num),PSNRV(:,num),MSSIM(num),SSIMV(:,num),MFSIM(num),FSIMV(:,num) ] = QuanAsse_psnr_ssim_fsim(img_clean,img_noisy);
    
    %------------- New method : FastHyMix (TNNLS, 2021) -------------
    num = 2;
    disp('*********************** FastHyMix ************************');
    [img_FastHyMix, ~, ~ ] = FastHyMix(img_noisy,  k_subspace); 
    [MPSNR(num),PSNRV(:,num),MSSIM(num),SSIMV(:,num),MFSIM(num),FSIMV(:,num) ] = QuanAsse_psnr_ssim_fsim(img_clean,img_FastHyMix);
    
 
%-------------  Show original and reconstructed data   -------------
figure;
set(gcf,'outerposition',get(0,'screensize'))
idx = 10;
subplot(1,3,1);
tmp = img_clean(:,:,idx);
tmp = sort(tmp(:));
minv = tmp(fix(numel(tmp)*0.02));
maxv =  tmp(fix(numel(tmp)*0.98));
imagesc(img_clean(:,:,idx),[minv,maxv]);
colormap('gray');
title(['Clean ',num2str(idx),'th band']);

subplot(1,3,2);
imagesc(img_noisy(:,:,idx),[minv,maxv]);
colormap('gray');
title(['Noisy band, MPSNR = ', num2str(round(MPSNR(1),2)),'dB']);
 
subplot(1,3,3);
imagesc(img_FastHyMix(:,:,idx),[minv,maxv]);
colormap('gray');
title(['Estimated by FastHyMix, MPSNR = ', num2str(round(MPSNR(2),2)),'dB']);

 

 





