SUBROUTINE lupsol(a,b,sol,row)
!---Forward and Back-substitution with Pivots---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN)::a(:,:); REAL(iwp),INTENT(IN)::b(:)
 REAL(iwp),INTENT(OUT)::sol(:); INTEGER,INTENT(IN)::row(:)
 INTEGER::i,j,n,irow; REAL(iwp)::total,temp(UBOUND(a,1)); n=UBOUND(a,1)
 temp=b
 DO i=1,n
   irow=row(i); total=b(irow)
   IF(i>1)THEN
     DO j=1,i-1
       total=total-a(irow,j)*temp(row(j))
     END DO
     temp(irow)=total
   END IF
 END DO
 DO i=n,1,-1
   irow=row(i); total=temp(irow)
   IF(i<n)THEN
     DO j=i+1,n
       total=total-a(irow,j)*temp(row(j))
     END DO
   END IF
   temp(irow)=total/a(irow,i)
 END DO
 sol=temp(row(:))
RETURN
END SUBROUTINE lupsol
