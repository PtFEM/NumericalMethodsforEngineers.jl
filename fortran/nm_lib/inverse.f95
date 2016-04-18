 FUNCTION inverse(matrix)
!---Returns Inverse of Small Matrix by Gauss-Jordan---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN)::matrix(:,:)
 REAL(iwp)::inverse(UBOUND(matrix,1),UBOUND(matrix,2))
 REAL(iwp)::temp(UBOUND(matrix,1),UBOUND(matrix,2))
 REAL(iwp)::hold(UBOUND(matrix,1))
 INTEGER::rows(UBOUND(matrix,1))
 INTEGER::i,k,n,max; REAL(iwp)::big,con,one=1.0_iwp,zero=0.0_iwp 
 n=UBOUND(matrix,1)
 temp=matrix
 DO i=1,n
   rows(i)=i
 END DO
 DO k=1,n
   big=zero
   DO i=k,n
     IF(ABS(temp(i,k))>big)THEN
       big=ABS(temp(i,k))
       max=i
     END IF
   END DO
   IF(max/=k)THEN
     hold=temp(max,:)
     temp(max,:)=temp(k,:)
     temp(k,:)=hold
     rows(k)=max
   END IF
   con=temp(k,k); temp(k,k)=one
   temp(k,:)=temp(k,:)/con
   DO i=1,n
     IF(i/=k) THEN
       con=temp(i,k); temp(i,k)=zero
       temp(i,:)=temp(i,:)-temp(k,:)*con
     END IF
   END DO
 END DO
 DO k=n-1,1,-1
   hold=temp(:,k)
   temp(:,k)=temp(:,rows(k))
   temp(:,rows(k))=hold
 END DO
 inverse=temp
END FUNCTION inverse

