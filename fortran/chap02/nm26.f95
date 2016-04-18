PROGRAM nm26
!---LU Factorization With Pivoting---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE        
 INTEGER::i,n  
 INTEGER,ALLOCATABLE::row(:)
 REAL(iwp),ALLOCATABLE::a(:,:),b(:),sol(:)
 OPEN(10,FILE='nm26.dat')  
 OPEN(11,FILE='nm26.res')
 READ(10,*)n  
 ALLOCATE(a(n,n),b(n),row(n),sol(n))
 READ(10,*)a 
 READ(10,*)b
 WRITE(11,'(A)')"---LU Factorization With Pivoting---"
 WRITE(11,'(/,A)')"Coefficient Matrix"
 a=TRANSPOSE(a)  
 DO i=1,n  
   WRITE(11,'(6E12.4)')a(i,:)  
 END DO
 WRITE(11,'(/,A)')"Right Hand Side Vector"  
 WRITE(11,'(6E12.4)')b
 CALL lupfac(a,row)  
 CALL lupsol(a,b,sol,row)
 WRITE(11,'(/,A)')"Back-Substitution Order"  
 WRITE(11,'(6I5)')row
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')sol
END PROGRAM nm26
