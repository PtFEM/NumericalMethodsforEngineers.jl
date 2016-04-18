SUBROUTINE lufac(a,lower,upper)
!-----LU Factorisation of a Square Matrix-----
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN)::a(:,:); REAL(iwp),INTENT(OUT)::lower(:,:),upper(:,:)
 INTEGER::i,j,k,l,n; REAL(iwp)::total,zero=.0_iwp; n=UBOUND(a,1)
 upper=zero; lower=zero; upper(1,:)=a(1,:)
 DO i=1,n; lower(i,i)=1.0_iwp; end do
 DO k=1,n-1
   IF(ABS(upper(k,k))>1.e-10_iwp)THEN
     DO i=k+1,n
!---Lower Triangular Factors---
       DO j=1,i-1
         total=zero
         DO l=1,j-1
           total= total-lower(i,l)*upper(l,j)
         END DO
         lower(i,j)=(a(i,j)+total)/upper(j,j)
       END DO
!---Upper Triangular Factors---
       DO j=1,n
         total=zero
         DO l=1,i-1
           total=total-lower(i,l)*upper(l,j)
         END DO
         upper(i,j)=a(i,j)+total
       END DO
     END DO
   ELSE
     WRITE(11,*)"Zero pivot found in row", k; EXIT
   END IF
 END DO
RETURN
END SUBROUTINE lufac
