PROGRAM nm23
!---Gaussian Elimination Using LDLT Factorization---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE        
 INTEGER::i,j,n  
 REAL(iwp),ALLOCATABLE::a(:,:),b(:),d(:)
 OPEN(10,FILE='nm23.dat')  
 OPEN(11,FILE='nm23.res')
 READ(10,*)n  
 ALLOCATE(a(n,n),b(n),d(n))
 DO i=1,n  
   READ(10,*)a(i,i:n)  
   a(i:n,i)=a(i,i:n)  
 END DO  
 READ(10,*)b
 WRITE(11,'(A)')"---Gaussian Elimination using LDLT Factorization---"
 WRITE(11,'(/,A)')"Coefficient Matrix" 
 DO i=1,n  
   WRITE(11,'(6E12.4)')a(i,:)  
 END DO
 WRITE(11,'(/,A)')"Right Hand Side Vector"  
 WRITE(11,'(6E12.4)')b
 CALL ldlt(a,d)
 WRITE(11,'(/A)')"Lower Triangular Factors" 
 DO i=1,n  
   WRITE(11,'(6E12.4)')(a(i,j)/d(j),j=1,i)  
 END DO
 WRITE(11,'(/,A)')"Diagonal Terms"  
 WRITE(11,'(6E12.4)')d
 CALL ldlfor(a,b)
 DO i=1,n  
   a(i,:)=a(i,:)/d(i)  
 END DO
 CALL subbac(a,b)
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')b
END PROGRAM nm23
