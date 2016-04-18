SUBROUTINE newton_cotes(samp,wt)
!---Provides Weights and Sampling Points for Newton-Cotes---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(OUT)::samp(:,:),wt(:); INTEGER::nsp
 nsp=UBOUND(samp,1)
 SELECT CASE(nsp)
   CASE(1)
     samp(1,1)=-1.0_iwp
     wt(1)=     2.0_iwp
   CASE(2)
     samp(1,1)=-1.0_iwp
     samp(2,1)= 1.0_iwp
     wt(1)=     1.0_iwp
     wt(2)=     1.0_iwp
   CASE(3)
     samp(1,1)=-1.0_iwp
     samp(2,1)= 0.0_iwp
     samp(3,1)= 1.0_iwp
     wt(1)=     0.33333333333333333333_iwp
     wt(2)=     1.33333333333333333333_iwp
     wt(3)=     0.33333333333333333333_iwp
   CASE(4)
     samp(1,1)=-1.0_iwp
     samp(2,1)=-0.33333333333333333333_iwp
     samp(3,1)= 0.33333333333333333333_iwp
     samp(4,1)= 1.0_iwp
     wt(1)=     0.25_iwp
     wt(2)=     0.75_iwp
     wt(3)=     0.75_iwp
     wt(4)=     0.25_iwp
   CASE(5)
     samp(1,1)=-1.0_iwp
     samp(2,1)=-0.5_iwp
     samp(3,1)= 0.0_iwp
     samp(4,1)= 0.5_iwp
     samp(5,1)= 1.0_iwp
     wt(1)=     0.15555555555555555556_iwp
     wt(2)=     0.71111111111111111111_iwp
     wt(3)=     0.26666666666666666667_iwp
     wt(4)=     0.71111111111111111111_iwp
     wt(5)=     0.15555555555555555556_iwp
   CASE DEFAULT
     WRITE(*,*)"Wrong number of integrating points"
   END SELECT
RETURN
END SUBROUTINE newton_cotes
