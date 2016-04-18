SUBROUTINE subfor(a,b)
!---Forward-substitution on a Lower Triangle---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN)::a(:,:); REAL(iwp),INTENT(IN OUT)::b(:)
 INTEGER::i,j,n; REAL(iwp)::total; n=UBOUND(a,1)
 DO i=1,n
   total=b(i)
   IF(i>1)THEN
     DO j=1,i-1; total=total-a(i,j)*b(j); END DO
   END IF
   b(i)=total/a(i,i)
 END DO
RETURN
END SUBROUTINE subfor
