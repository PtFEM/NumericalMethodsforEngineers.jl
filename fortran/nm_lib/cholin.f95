SUBROUTINE cholin(kb)
!---Choleski Factorization on a Lower Triangle Stored as a Band---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(in out)::kb(:,:); INTEGER::i,j,k,l,ia,ib,n,iw; REAL(iwp)::x
 n=UBOUND(kb,1); iw=UBOUND(kb,2)-1
 DO i=1,n
   x=.0_iwp
   DO j=1,iw; x=x+kb(i,j)**2; END DO
   kb(i,iw+1)=SQRT(kb(i,iw+1)-x)
   DO k=1,iw
     x=.0_iwp
     IF(i+k<=n)THEN
       IF(k/=iw)THEN
         DO l=iw-k,1,-1
           x=x+kb(i+k,l)*kb(i,l+k)
         END DO
       END IF
       ia=i+k; ib=iw-k+1
       kb(ia,ib)=(kb(ia,ib)-x)/kb(i,iw+1)
     END IF
   END DO
 END DO
RETURN
END SUBROUTINE cholin
