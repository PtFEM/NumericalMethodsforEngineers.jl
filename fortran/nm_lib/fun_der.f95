SUBROUTINE fun_der(fun,der,points,i)
!---Computes Derivatives of Shape Functions w.r.t. Local Coordinates---
USE precision; IMPLICIT NONE
 INTEGER,INTENT(IN)::i; REAL(iwp),INTENT(IN)::points(:,:)
 REAL(iwp),INTENT(OUT)::der(:,:),fun(:)
 REAL(iwp)::eta,xi,zeta,xi0,eta0,zeta0,etam,etap,xim,xip,c1,c2,c3
 REAL(iwp)::t1,t2,t3,t4,t5,t6,t7,t8,t9,x2p1,x2m1,e2p1,e2m1,zetam,zetap
 REAL(iwp),PARAMETER::zero=0.0_iwp,pt125=0.125_iwp,pt25=0.25_iwp,         &
   pt5=0.5_iwp,pt75=0.75_iwp,one=1.0_iwp,two=2.0_iwp,d3=3.0_iwp,          &
   d4=4.0_iwp,d5=5.0_iwp,d6=6.0_iwp,d8=8.0_iwp,d9=9.0_iwp,d10=10.0_iwp,   &
   d11=11.0_iwp,d12=12.0_iwp,d16=16.0_iwp,d18=18.0_iwp,d27=27.0_iwp,      &
   d32=32.0_iwp,d36=36.0_iwp,d54=54.0_iwp,d64=64.0_iwp,d128=128.0_iwp
 INTEGER::xii(20),etai(20),zetai(20),l,ndim,nod
 ndim=UBOUND(der,1)
 SELECT CASE(ndim)
 CASE(1)      ! one dimension
   xi= points(i,1)
   der(1,1)=-pt5; der(1,2)= pt5
   fun=(/pt5*(one-xi),pt5*(one+xi)/)
 CASE(2)      ! two dimensions
   xi= points(i,1); eta=points(i,2)
   etam=pt25*(one-eta); etap=pt25*(one+eta)
   xim= pt25*(one-xi); xip= pt25*(one+xi)
   der(1,1)=-etam; der(1,2)=-etap; der(1,3)=etap; der(1,4)=etam
   der(2,1)=-xim; der(2,2)=xim; der(2,3)=xip; der(2,4)=-xip
   fun=(/d4*xim*etam,d4*xim*etap,d4*xip*etap,d4*xip*etam/)
 CASE(3)      ! three dimensions
   xi  =points(i,1); eta =points(i,2); zeta=points(i,3)
   etam=one-eta; xim=one-xi; zetam=one-zeta
   etap=eta+one; xip=xi+one; zetap=zeta+one
   der(1,1)=-pt125*etam*zetam; der(1,2)=-pt125*etam*zetap
   der(1,3)= pt125*etam*zetap; der(1,4)= pt125*etam*zetam
   der(1,5)=-pt125*etap*zetam; der(1,6)=-pt125*etap*zetap
   der(1,7)= pt125*etap*zetap; der(1,8)= pt125*etap*zetam
   der(2,1)=-pt125*xim*zetam; der(2,2)=-pt125*xim*zetap
   der(2,3)=-pt125*xip*zetap; der(2,4)=-pt125*xip*zetam
   der(2,5)= pt125*xim*zetam; der(2,6)= pt125*xim*zetap
   der(2,7)= pt125*xip*zetap; der(2,8)= pt125*xip*zetam
   der(3,1)=-pt125*xim*etam; der(3,2)= pt125*xim*etam
   der(3,3)= pt125*xip*etam; der(3,4)=-pt125*xip*etam
   der(3,5)=-pt125*xim*etap; der(3,6)= pt125*xim*etap
   der(3,7)= pt125*xip*etap; der(3,8)=-pt125*xip*etap
   fun=(/pt125*xim*etam*zetam,pt125*xim*etam*zetap,                       &
           pt125*xip*etam*zetap,pt125*xip*etam*zetam,                     &
           pt125*xim*etap*zetam,pt125*xim*etap*zetap,                     &
           pt125*xip*etap*zetap,pt125*xip*etap*zetam/)
 CASE DEFAULT
   WRITE(*,*)"Wrong number of dimensions"
 END SELECT
RETURN
END SUBROUTINE fun_der
