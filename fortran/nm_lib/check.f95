LOGICAL FUNCTION check(x1,x0,tol)
!---Checks Convergence of Two Scalars---
 USE precision; IMPLICIT NONE
!---.TRUE. if converged; no update of x0---
 REAL(iwp),INTENT(IN)::x0,x1,tol
 check=.NOT.ABS(x1-x0)/ABS(x0)>tol
RETURN
END FUNCTION check
