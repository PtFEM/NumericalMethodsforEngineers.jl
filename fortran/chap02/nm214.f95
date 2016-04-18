PROGRAM nm214
!---Preconditioned Conjugate Gradients For Linear Simultaneous Equations---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE        
 INTEGER::i,iters,limit,n  
 REAL(iwp)::alpha,beta,one=1.0_iwp,tol,up
 REAL(iwp),ALLOCATABLE::a(:,:),b(:),d(:),p(:),precon(:),u(:),x(:),xnew(:)
 OPEN(10,FILE='nm214.dat')  
 OPEN(11,FILE='nm214.res')
 READ(10,*)n  
 ALLOCATE(a(n,n),b(n),x(n),xnew(n),d(n),p(n),u(n),precon(n))
 READ(10,*)a  
 READ(10,*)b  
 READ(10,*)x,tol,limit
 WRITE(11,'(A)')"---Preconditioned Conjugate Gradients---"
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
 DO i=1,n  
   precon(i)=one/a(i,i)  
 END DO
! If x=.0 p and r are just b but in general b=b-a*x
 b=b-MATMUL(a,x)  
 d=precon*b  
 p=d
 WRITE(11,'(/,A)')"First Few Iterations"  
 iters=0    
 DO  
   iters=iters+1
   u=MATMUL(a,p)  
   up=DOT_PRODUCT(b,d)  
   alpha=up/DOT_PRODUCT(p,u)
   xnew=x+alpha*p  
   b=b-alpha*u  
   d=precon*b 
   beta=DOT_PRODUCT(b,d)/up  
   p=d+beta*p
   IF(iters<5)WRITE(11,'(6E12.4)')x
   IF(checkit(xnew,x,tol).OR.iters==limit)EXIT  
   x=xnew
 END DO
 WRITE(11,'(/,A,/,I5)')"Iterations to Convergence",iters
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')x
END PROGRAM nm214
