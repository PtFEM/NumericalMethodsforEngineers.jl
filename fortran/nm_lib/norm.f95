FUNCTION norm(x)
!---Returns L2 Norm of Vector x---
 USE precision; IMPLICIT NONE
 REAL(iwp),INTENT(IN)::x(:); REAL(iwp)::norm
 norm=SQRT(SUM(x**2))
END FUNCTION norm
