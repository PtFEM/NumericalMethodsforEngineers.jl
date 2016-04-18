PROGRAM nm25
!---Cholesky LLT Factorization Using Skyline Storage---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE        
 INTEGER::ir,n  
 INTEGER,ALLOCATABLE::kdiag(:)
 REAL(iwp),ALLOCATABLE::a(:),b(:)
 OPEN(10,FILE='nm25.dat')  
 OPEN(11,FILE='nm25.res')
 READ(10,*)n  
 ALLOCATE(kdiag(n),b(n))
 READ(10,*)kdiag  
 ir=kdiag(n)  
 ALLOCATE(a(ir))  
 READ(10,*)a  
 READ(10,*)b
 WRITE(11,'(A)')"---Cholesky LLT Factorization Using Skyline Storage---"
 WRITE(11,'(/,A)')"Coefficient Vector"  
 WRITE(11,'(6E12.4)')a
 WRITE(11,'(/,A)')"Diagonal Locations"  
 WRITE(11,'(8I5)')kdiag
 WRITE(11,'(/,A)')"Right Hand Side Vector"  
 WRITE(11,'(6E12.4)')b
 CALL sparin(a,kdiag)  
 CALL spabac(a,b,kdiag)
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')b
END PROGRAM nm25
