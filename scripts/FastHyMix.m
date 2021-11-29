
function [image_AdaptiveDenoiser, M,    noise_std_Gaussion   ] = FastHyMix(img_noisy,  k_subspace) 
% 
% Input: -------------
%
% img_noisy   -     Hyperspectral data set with size (L x C x N),
%                   where L, C, and N are the number of rows,
%                   columns, and bands, respectively.
%
% k_subspace  -     Spectral subspace dimension (default = 8)
%
% Output: --------------
%
% image_AdaptiveDenoiser  -  Denoised hyperspectral data with (L x C x N)
% M                       -  A mask tensor of size L x C x N indicating whether the pixel is corrupted by Gaussian noise (M(i,j,k)=1) or sparse noise (M(i,j,k)=0)
% noise_std_Gaussion      -  Standard deviation of Gaussian noise per band
  
% ---------------------------- -------------------------------------------
% See more details in papers:
%   [1] Lina Zhuang and Michael K. Ng, “FastHyMix: Fast and 
%       Parameter-free Hyperspectral Image Mixed Noise Removal”, IEEE 
%       Transactions on Neural Networks and Learning Systems, 2021.
%       DOI: 10.1109/TNNLS.2021.3112577 
%
%
%% -------------------------------------------------------------------------
%
% Copyright (Nov. 2021):
%            Lina Zhuang (linazhuang@qq.com)
%
%
% HySuDeep is distributed under the terms of
% the GNU General Public License 2.0.
%
% Permission to use, copy, modify, and distribute this software for
% any purpose without fee is hereby granted, provided that this entire
% notice is included in all copies of any software which is or includes
% a copy or modification of this software and in all copies of the
% supporting documentation for such software.
% This software is being provided "as is", without any express or
% implied warranty.  In particular, the authors do not make any
% representation or warranty of any kind concerning the merchantability
% of this software or its fitness for any particular purpose."
% ---------------------------------------------------------------------

[image_AdaptiveDenoiser, M,    noise_std_Gaussion   ] = FastHyMix_core(img_noisy,  k_subspace) ;
 