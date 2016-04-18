PROGRAM nm21
!---Gaussian Elimination for Linear Simultaneous Equations---
 IMPLICIT NONE 
 INTEGER,PARAMETER::iwp=SELECTED_REAL_KIND(15,300)
 INTEGER::i,j,k,n 
 REAL(iwp)::x,zero=0.0_iwp
 REAL(iwp),ALLOCATABLE::a(:,:),b(:)
 OPEN(10,FILE='nm21.dat') 
 OPEN(11,FILE='nm21.res')
 READ(10,*)n  
 ALLOCATE(a(n,n),b(n)) 
 READ(10,*)a
 READ(10,*)b
 WRITE(11,'(A)')                                                &
   "---Gaussian Elimination for Linear Simultaneous Equations---"
 WRITE(11,'(/,A)')"Coefficient Matrix"
 a=TRANSPOSE(a)
 DO i=1,n
   WRITE(11,'(6E12.4)')a(i,:)
 END DO
 WRITE(11,'(/,A)')"Right Hand Side Vector"
 WRITE(11,'(6E12.4)')b
!---Convert to Upper Triangular Form---
 DO k=1,n-1
   IF(ABS(a(k,k))>1.E-6_iwp)THEN
     DO i=k+1,n
        x=a(i,k)/a(k,k)
        a(i,k)=zero
        DO j=k+1,n
          a(i,j)=a(i,j)-a(k,j)*x
        END DO
        b(i)=b(i)-b(k)*x
     END DO
   ELSE
     WRITE(11,*)"Zero pivot found in row",k
     STOP
   END IF
 END DO
 WRITE(11,'(/,A)')"Modified Matrix"
 DO i=1,n
   WRITE(11,'(6E12.4)')a(i,:)
 END DO
 WRITE(11,'(/,A)')"Modified Right Hand Side Vector" 
 WRITE(11,'(6E12.4)')b
!---Back-substitution---
 DO i=n,1,-1
   x=b(i)
   IF(i<n)THEN
     DO j=i+1,n
       x=x-a(i,j)*b(j)
     END DO
   END IF
   b(i)=x/a(i,i)
 END DO
 WRITE(11,'(/,A)')"Solution Vector"
 WRITE(11,'(6E12.4)')b
END PROGRAM nm21
