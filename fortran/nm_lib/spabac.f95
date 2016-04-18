SUBROUTINE spabac(a,b,kdiag)
!---Choleski Forward and Back-substitution on a Skyline Matrix---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN)::a(:); REAL(iwp),INTENT(in out)::b(:)
 INTEGER,INTENT(IN)::kdiag(:); INTEGER::n,i,ki,l,m,j,it,k; REAL(iwp)::x
 n=UBOUND(kdiag,1)
 b(1)=b(1)/a(1)
 DO i=2,n
   ki=kdiag(i)-i
   l=kdiag(i-1)-ki+1
   x=b(i)
   IF(l/=i)THEN
     m=i-1
     DO j=l,m
       x=x-a(ki+j)*b(j)
     END DO
   END IF
   b(i)=x/a(ki+i)
 END DO
 DO it=2,n
   i=n+2-it
   ki=kdiag(i)-i
   x=b(i)/a(ki+i)
   b(i)=x
   l=kdiag(i-1)-ki+1
   IF(l/=i)THEN
     m=i-1
     DO k=l,m
       b(k)=b(k)-x*a(ki+k)
     END DO
   END IF
 END DO
 b(1)=b(1)/a(1)
RETURN
END SUBROUTINE spabac
