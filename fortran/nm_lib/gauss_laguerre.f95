SUBROUTINE gauss_laguerre(samp,wt)
!---Provides Weights and Sampling Points for Gauss-Laguerre---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(OUT)::samp(:,:),wt(:); INTEGER::nsp
 nsp=UBOUND(samp,1)
 SELECT CASE(nsp)
   CASE(1)
     samp(1,1)= 1.0_iwp
     wt(1)= 1.0_iwp
   CASE(2)
     samp(1,1)= 0.58578643762690495119_iwp
     samp(2,1)= 3.41421356237309504880_iwp
     wt(1)=     0.85355339059327376220_iwp
     wt(2)=     0.14644660940672623779_iwp
   CASE(3)
     samp(1,1)= 0.41577455678347908331_iwp
     samp(2,1)= 2.29428036027904171982_iwp
     samp(3,1)= 6.28994508293747919686_iwp
     wt(1)=     0.71109300992917301544_iwp
     wt(2)=     0.27851773356924084880_iwp
     wt(3)=     0.01038925650158613574_iwp
   CASE(4)
     samp(1,1)= 0.32254768961939231180_iwp
     samp(2,1)= 1.74576110115834657568_iwp
     samp(3,1)= 4.53662029692112798327_iwp
     samp(4,1)= 9.39507091230113312923_iwp
     wt(1)=     0.60315410434163360163_iwp
     wt(2)=     0.35741869243779968664_iwp
     wt(3)=     0.03888790851500538427_iwp
     wt(4)=     0.00053929470556132745_iwp
   CASE(5)
     samp(1,1)= 0.26356031971814091020_iwp
     samp(2,1)= 1.41340305910651679221_iwp
     samp(3,1)= 3.59642577104072208122_iwp
     samp(4,1)= 7.08581000585883755692_iwp
     samp(5,1)= 12.6408008442757826594_iwp
     wt(1)=     0.52175561058280865247_iwp
     wt(2)=     0.39866681108317592745_iwp
     wt(3)=     0.07594244968170759538_iwp
     wt(4)=     0.00361175867992204845_iwp
     wt(5)=     0.00002336997238577622_iwp
   CASE DEFAULT
     WRITE(*,*)"Wrong number of integrating points"
 END SELECT
RETURN
END SUBROUTINE gauss_laguerre
