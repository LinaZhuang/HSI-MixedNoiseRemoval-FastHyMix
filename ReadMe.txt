%%  The code and data herein distributed reproduce the results published in
%  the paper 
%
%       Lina Zhuang and Michael K. Ng, “FastHyMix: Fast and 
%       Parameter-free Hyperspectral Image Mixed Noise Removal”, IEEE 
%       Transactions on Neural Networks and Learning Systems, 2021.
%       DOI: 10.1109/TNNLS.2021.3112577 
% 
%
% 
% 
%% Description:
% 
% Demo_FastHyMix.m                                       ---- main script reproducing the denoising results published in the paper
% FastHyMix.m                                                  ---- denoising algorithm FastHyMix
% img_clean_dc.mat & img_clean_pavia.mat     ---- Simulated clean datasets
% 
% 
% 
%%  Notes:
%
%   1) Package instalation: unzip the files to a directory and run the
%   scripts of "Demo_FastHyMix.m", which reproduces the denoising results
%   reported in the above paper.
%
%
%   2) FastHyMix.m is the core funtion. It is a denoiser
%       designed for hyperspectral images corrupted with mixed noise.
%      
%  
%   
%% ACKNOWLEDGMENTS
%
% The authors acknowledge the following individuals and organisations:
%
%
%   - Prof. Paolo Gamba from Pavia university, 
%     for making the Pavia University data set available to the community.
%
%   - Prof. David Landgrebe and Larry Biehl from Purdue University, 
%     for making the Washington DC Mall data set available to the community.
%
%   - Authors of BM3D (K. Dabov, A. Foi, V. Katkovnik, and K. Egiazarian) from
%      Sandia National Laboratories, for making the BM3D package available to the community.
%  
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author: Lina Zhuang, Nov. 2021
%
