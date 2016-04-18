PROGRAM nm210
!---Successive Overrelaxation For Linear Simultaneous Equations---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE        
 INTEGER::i,iters,limit,n  
 REAL(iwp)::diag,omega,one=1.0_iwp,tol,zero=0.0_iwp
 REAL(iwp),ALLOCATABLE::a(:,:),b(:),u(:,:),x(:),xnew(:)
 OPEN(10,FILE='nm210.dat')  
 OPEN(11,FILE='nm210.res')
 READ(10,*)n  
 ALLOCATE(a(n,n),u(n,n),b(n),x(n),xnew(n))
 READ(10,*)a  
 READ(10,*)b  
 READ(10,*)x,omega,tol,limit
 WRITE(11,'(A)')"---Successive Overrelaxation---"
 WRITE(11,'(A)')"---For Linear Simultaneous Equations---"
 WRITE(11,'(/,A)')"Coefficient Matrix"
 a=TRANSPOSE(a)  
 DO i=1,n  
   WRITE(11,'(6E12.4)')a(i,:)  
 END DO
 WRITE(11,'(/,A)')"Right Hand Side Vector"  
 WRITE(11,'(6E12.4)')b
 WRITE(11,'(/,A)')"Guessed Starting Vector"  
 WRITE(11,'(6E12.4)')x
 WRITE(11,'(/,A,/,E12.4)')"Overrelaxation Scalar",omega
 DO i=1,n  
   diag=a(i,i)  
   a(i,:)=a(i,:)/diag  
   b(i)=omega*b(i)/diag  
 END DO
 u=zero  
 a=a*omega  
 DO i=1,n  
   u(i,i+1:)=-a(i,i+1:)  
   a(i,i+1:)=zero  
 END DO
 DO i=1,n  
   a(i,i)=one  
   u(i,i)=one-omega  
 END DO
 WRITE(11,'(/,A)')"First Few Iterations"  
 iters=0    
 DO  
   iters=iters+1
   xnew=b+MATMUL(u,x)  
   CALL subfor(a,xnew)
   IF(iters<5)WRITE(11,'(6E12.4)')x
   IF(checkit(xnew,x,tol).OR.iters==limit)EXIT  
   x=xnew
 END DO
 WRITE(11,'(/,A,/,I5)')"Iterations to Convergence",iters
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')x
END PROGRAM nm210
