function  [MPSNR,PSNRV,MSSIM,SSIMV,MFSIM,FSIMV ] = QuanAsse_psnr_ssim_fsim(Ori_H,Denoi_HSI)
[M,N,B] = size(Ori_H);
 

 for i=1:B
     T1 = Ori_H(:,:,i);T2 = Denoi_HSI(:,:,i);
 PSNRV(i) = psnr(T2,T1,max(T1(:)));
[SSIMV(i) , ~]=ssim_index(Ori_H(:,:,i)*255, Denoi_HSI(:,:,i)*255);%ssim_index(Ori_H(:,:,i)*255, Denoi_HSI(:,:,i)*255);
  FSIMV(i) = FSIM(Ori_H(:,:,i)*255,Denoi_HSI(:,:,i)*255);
 end
 MPSNR = mean(PSNRV)
  MSSIM = mean(SSIMV);
  MFSIM = mean(FSIMV);
 
