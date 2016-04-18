LOGICAL FUNCTION checkit(loads,oldlds,tol)
!---Checks Convergence of Two Vectors---
 USE precision; IMPLICIT NONE
!---.TRUE. if converged; no update of oldlds---
 REAL(iwp),INTENT(IN)::loads(:),oldlds(:),tol 
 REAL(iwp)::big; INTEGER::i,neq; LOGICAL::converged
 neq=UBOUND(loads,1); big=.0_iwp; converged=.TRUE.
 DO i=1,neq; IF(ABS(loads(i))>big)big=ABS(loads(i)); END DO
 DO i=1,neq; IF(ABS(loads(i)-oldlds(i))/big>tol)converged=.FALSE.; END DO
 checkit=converged
RETURN
END FUNCTION checkit
