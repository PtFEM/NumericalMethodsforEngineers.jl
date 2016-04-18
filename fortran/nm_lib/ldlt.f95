SUBROUTINE ldlt(a,d)
!---LDLT Factorization of a Square Matrix---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN OUT)::a(:,:); real(iwp),INTENT(OUT)::d(:)
 INTEGER::i,j,k,n; REAL(iwp)::x,small=1.E-10_iwp; n=UBOUND(a,1)
 DO k=1,n-1
   d(1)=a(1,1)
   IF(ABS(a(k,k))>small)THEN
     DO i=k+1,n
       x=a(i,k)/a(k,k)
       DO j=k+1,n; a(i,j)=a(i,j)-a(k,j)*x; END DO
       d(i)=a(i,i)
     END DO
   ELSE; WRITE(11,*)"Zero pivot found in row ",k
   END IF
 END DO
RETURN
END SUBROUTINE ldlt
