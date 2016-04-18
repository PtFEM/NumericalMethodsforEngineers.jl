PROGRAM nm22
!---Gaussian Elimination using LU Factorization---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE        
 INTEGER::i,n  
 REAL(iwp),ALLOCATABLE::a(:,:),b(:),lower(:,:),upper(:,:)
 OPEN(10,FILE='nm22.dat')  
 OPEN(11,FILE='nm22.res')
 READ(10,*)n  
 ALLOCATE(a(n,n),lower(n,n),upper(n,n),b(n))
 READ(10,*)a  
 READ(10,*)b
 WRITE(11,'(A)')"---Gaussian Elimination using LU Factorisation---"
 WRITE(11,'(/,A)')"Coefficient Matrix"
 a=TRANSPOSE(a)  
 DO i=1,n  
   WRITE(11,'(6E12.4)')a(i,:)  
 END DO
 WRITE(11,'(/,A)')"Right Hand Side Vector"  
 WRITE(11,'(6E12.4)')b
 CALL lufac(a,lower,upper)
 WRITE(11,'(/,A)')"Lower Triangular Factors"
 DO i=1,n  
   WRITE(11,'(6E12.4)')lower(i,:)  
 END DO
 WRITE(11,'(/,A)')"Upper Triangular Factors"
 DO i=1,n  
   WRITE(11,'(6E12.4)')upper(i,:)  
 END DO
 CALL subfor(lower,b)
 CALL subbac(upper,b)
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')b
END PROGRAM nm22
