FUNCTION determinant(jac)
!---Returns Determinant of a 1x1, 2x2 or 3x3 Jacobian Matrix---
 USE precision; IMPLICIT NONE; INTEGER::it     
 REAL(iwp),INTENT(IN)::jac(:,:); REAL(iwp)::det,determinant
 it=UBOUND(jac,1)  
 SELECT CASE(it)
 CASE(1)
   det=1.0_iwp
 CASE(2)
   det=jac(1,1)*jac(2,2)-jac(1,2)*jac(2,1)
 CASE(3)
   det=jac(1,1)*(jac(2,2)*jac(3,3)-jac(3,2)*jac(2,3))
   det=det-jac(1,2)*(jac(2,1)*jac(3,3)-jac(3,1)*jac(2,3))
   det=det+jac(1,3)*(jac(2,1)*jac(3,2)-jac(3,1)*jac(2,2))
 CASE DEFAULT
   WRITE(*,*)"Wrong dimension for Jacobian matrix"
 END SELECT
 determinant=det
RETURN
END FUNCTION determinant
