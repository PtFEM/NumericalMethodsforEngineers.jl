SUBROUTINE chobac(kb,loads)
!---Choleski Forward and Back-substitution---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN)::kb(:,:); REAL(iwp),INTENT(in out)::loads(:)
 INTEGER::iw,n,i,j,k,l,m; REAL(iwp)::x
 n=SIZE(kb,1); iw=SIZE(kb,2)-1
 loads(1)=loads(1)/kb(1,iw+1)
 DO i=2,n
   x=.0_iwp;k=1
   IF(i<=iw+1)k=iw-i+2
   DO j=k,iw; x=x+kb(i,j)*loads(i+j-iw-1); END DO
   loads(i)=(loads(i)-x)/kb(i,iw+1)
 END DO
 loads(n)=loads(n)/kb(n,iw+1)
 DO i=n-1,1,-1
   x=0.0_iwp; l=i+iw
   IF(i>n-iw)l=n; m=i+1
   DO j=m,l; x=x+kb(j,iw+i-j+1)*loads(j); END DO
   loads(i)=(loads(i)-x)/kb(i,iw+1)
 END DO
RETURN
END SUBROUTINE chobac
