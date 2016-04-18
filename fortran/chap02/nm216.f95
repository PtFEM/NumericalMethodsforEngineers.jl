PROGRAM nm216
!---BiCGSTAB Scheme(Right Preconditioned)---
!---For Linear Simultaneous Equations---
 USE nm_lib  
 USE precision  
 IMPLICIT NONE
 INTEGER::i,iters,limit,n  
 LOGICAL::converged 
 REAL(iwp)::alpha,beta,one=1.0_iwp,rho0,rho1,tol,w,zero=0.0_iwp 
 REAL(iwp),ALLOCATABLE::a(:,:),b(:),p(:),precon(:),p1(:),r(:),r0_hat(:),  &
   s(:),s1(:),t(:),v(:),x(:)
 OPEN(10,FILE='nm216.dat')  
 OPEN(11,FILE='nm216.res')
 READ(10,*)n
 ALLOCATE(x(n),v(n),r(n),b(n),r0_hat(n),p(n),s(n),t(n),a(n,n),precon(n),  &
   p1(n),s1(n))
 READ(10,*)a  
 READ(10,*)b  
 READ(10,*)x,tol,limit
 WRITE(11,'(A)')"---BiCGSTAB Scheme(Right Preconditioned)---"
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
!---Simple diagonal preconditioner---
 DO i=1,n  
   precon(i)=one/a(i,i)  
 END DO
 DO i=1,n  
   a(i,:)=a(i,:)*precon(i)  
 END DO
!---Apply preconditioner to right hand side---
 b=b*precon  
 r=b-MATMUL(a,x)  
 r0_hat=r  
 x=x/precon
 rho0=one  
 alpha=one  
 w=one  
 v=zero  
 p=zero  
 rho1=DOT_PRODUCT(r0_hat,r)
 WRITE(11,'(/,A)')"First Few Iterations"  
 iters=0
 DO  
   iters=iters+1  
   converged=norm(r)<tol*norm(b)
   IF(iters==limit.OR.converged)EXIT
   beta=(rho1/rho0)*(alpha/w)  
   p=r+beta*(p-w*v)  
   p1=p*precon
   v=MATMUL(a,p1)  
   alpha=rho1/DOT_PRODUCT(r0_hat,v)  
   s=r-alpha*v
   s1=s*precon  
   t=MATMUL(a,s1)  
   w=DOT_PRODUCT(t,s)/DOT_PRODUCT(t,t) 
   rho0=rho1  
   rho1=-w*DOT_PRODUCT(r0_hat,t)  
   x=x+alpha*p+w*s  
   r=s-w*t
   IF(iters<5)WRITE(11,'(6E12.4)')x*precon
 END DO
 x=x*precon
 WRITE(11,'(/,A,/,I5)')"Iterations to Convergence",iters
 WRITE(11,'(/,A)')"Solution Vector"  
 WRITE(11,'(6E12.4)')x
END PROGRAM nm216
