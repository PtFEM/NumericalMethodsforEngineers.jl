SUBROUTINE sparin(a,kdiag)
!---Choleski Factorization of Symmetric Skyline Matrix---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN OUT)::a(:); INTEGER,INTENT(IN)::kdiag(:)
 INTEGER::n,i,ki,l,kj,j,ll,m,k; REAL(iwp)::x
 n=UBOUND(kdiag,1); a(1)=SQRT(a(1))
 DO i=2,n
   ki=kdiag(i)-i
   l=kdiag(i-1)-ki+1
   DO j=l,i
     x=a(ki+j)
     kj=kdiag(j)-j
     IF(j/=1)THEN
       ll=kdiag(j-1)-kj+1
       ll=MAX(l,ll)
       IF(ll/=j)THEN
         m=j-1
         DO k=ll,m
           x=x-a(ki+k)*a(kj+k)
         END DO
       END IF
     END IF
     a(ki+j)=x/a(kj+j)
   END DO
   a(ki+i)=SQRT(x)
 END DO
RETURN
END SUBROUTINE sparin
