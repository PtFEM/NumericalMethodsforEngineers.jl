PROGRAM nm24
!---Cholesky LLT Factorization Using Banded Storage---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE        
 INTEGER::i,iw,iwp1,j,n  
 REAL(iwp),ALLOCATABLE::b(:),lb(:,:)
 OPEN(10,FILE='nm24.dat')  
 OPEN(11,FILE='nm24.res')
 READ(10,*)n,iw  
 iwp1=iw+1  
 ALLOCATE(b(n),lb(n,iwp1))
 READ(10,*)(lb(i,:),i=1,n)  
 READ(10,*)b
 WRITE(11,'(A)')"---Cholesky LLT Factorization Using Banded Storage---"
 WRITE(11,'(/,A)')"Banded Coefficient Matrix" 
 DO i=1,n  
   WRITE(11,'(6E12.4)')lb(i,:)  
 END DO
 WRITE(11,'(/,A)')"Right Hand Side Vector"  
 WRITE(11,'(6E12.4)')b
 CALL cholin(lb)
 WRITE(11,'(/,A)')"L in Band Form"
 DO i=1,n  
   WRITE(11,'(6E12.4)')lb(i,:)  
 END DO
 CALL chobac(lb,b)
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')b
END PROGRAM nm24
