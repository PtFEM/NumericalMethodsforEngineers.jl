SUBROUTINE subbac(a,b)
!---Back-substitution on an Upper Triangle---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN)::a(:,:); REAL(iwp),INTENT(IN OUT)::b(:)
 INTEGER::i,j,n; REAL(iwp)::total; n=UBOUND(a,1)
 DO i=n,1,-1
   total=b(i)
   IF(i<n)THEN
     DO j=i+1,n; total=total-a(i,j)*b(j); END DO
   END IF
   b(i)=total/a(i,i)
 END DO 
RETURN
END SUBROUTINE subbac
