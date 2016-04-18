SUBROUTINE lupfac(a,row)
!---LU Factorization of a Square Matrix with Pivoting---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN OUT)::a(:,:); INTEGER,INTENT(OUT)::row(:)
 INTEGER::i,j,k,ip,ie,ih,irow,n; REAL(iwp)::pval,pivot,small=1.E-10_iwp
 n=UBOUND(a,1); DO i=1,n; row(i)=i; END DO
 DO i=1,n-1
   ip=i; pval=a(row(ip),ip)
   DO j=i+1,n
     IF(ABS(a(row(j),i))>ABS(pval))THEN
       ip=j; pval=a(row(j),i)
     END IF
   END DO
   IF(ABS(pval)<small)THEN
     WRITE(11,*)"Singular equations detected"; STOP
   END IF
   ih=row(ip); row(ip)=row(i); row(i)=ih
   DO j=i+1,n
     ie= row(j); pivot=a(ie,i)/pval; a(ie,i)=pivot; irow=row(i)
     DO k=i+1,n
       a(ie,k)=a(ie,k)-a(irow,k)*pivot
     END DO
   END DO
 END DO
 IF(ABS(a(row(n),n))< small)THEN
   WRITE(11,*)"Singular equations detected"; STOP
 END IF
RETURN
END SUBROUTINE lupfac
