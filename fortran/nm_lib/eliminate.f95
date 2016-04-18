FUNCTION eliminate(a,b)
!---Gaussian elimination with partial pivoting on n*n matrix a and rhs b---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN OUT)::a(:,:),b(:); REAL(iwp)::eliminate(UBOUND(b,1)) 
 REAL(iwp)::big,hold,fac
 INTEGER::i,j,l,n,ihold; n=UBOUND(a,1)
!--------------------------- Pivoting stage -------------------------------
 DO i=1,n-1
   big=ABS(a(i,i)); ihold=i
   DO j=i+1,n
     IF(ABS(a(j,i))>big)THEN
       big=ABS(a(j,i)); ihold=j
     END IF
   END DO
   IF(ihold/=i)THEN
     DO j=i,n
       hold=a(i,j); a(i,j)=a(ihold,j); a(ihold,j)=hold
     END DO
     hold=b(i); b(i)=b(ihold); b(ihold)=hold
   END IF
!-------------------------- Elimination stage -----------------------------
   DO j=i+1,n
     fac=a(j,i)/a(i,i)
     DO l=i,n
       a(j,l)=a(j,l)-a(i,l)*fac
     END DO
     b(j)=b(j)-b(i)*fac
   END DO
 END DO
!--------------------------- Backsubstitution -----------------------------
 DO i=n,1,-1
   hold=.0_iwp
   DO l=i+1,n; hold=hold+a(i,l)*b(l); END DO
   b(i)=(b(i)-hold)/a(i,i)
 END DO
 eliminate = b
RETURN
END FUNCTION eliminate
