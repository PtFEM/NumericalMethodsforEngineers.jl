PROGRAM nm212
!---Conjugate Gradients For Linear Simultaneous Equations---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE        
 INTEGER::i,iters,limit,n  
 REAL(iwp)::alpha,beta,tol,up
 REAL(iwp),ALLOCATABLE::a(:,:),b(:),p(:),r(:),u(:),x(:),xnew(:)
 OPEN(10,FILE='nm212.dat')  
 OPEN(11,FILE='nm212.res')
 READ(10,*)n  
 ALLOCATE(a(n,n),b(n),x(n),xnew(n),r(n),p(n),u(n))
 READ(10,*)a  
 READ(10,*)b  
 READ(10,*)x,tol,limit
 WRITE(11,'(A)')"---Conjugate Gradients---"
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
 r=b-MATMUL(a,x)  
 p=r
 WRITE(11,'(/,A)')"First Few Iterations"  
 iters=0    
 DO  
   iters=iters+1
   u=MATMUL(a,p)  
   up=DOT_PRODUCT(r,r)  
   alpha=up/DOT_PRODUCT(p,u)
   xnew=x+alpha*p  
   r=r-alpha*u  
   beta=DOT_PRODUCT(r,r)/up  
   p=r+beta*p
   IF(iters<5)WRITE(11,'(6E12.4)')x
   IF(checkit(xnew,x,tol).OR.iters==limit)EXIT  
   x=xnew
 END DO
 WRITE(11,'(/,A,/,I5)')"Iterations to Convergence",iters
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')x
END PROGRAM nm212
