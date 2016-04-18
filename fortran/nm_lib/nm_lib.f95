MODULE nm_lib
!
INTERFACE
!
FUNCTION check(x1,x0,tol)
 USE precision
 REAL(iwp),INTENT(IN)::x0,x1,tol
 LOGICAL::check
END FUNCTION check
!
FUNCTION checkit(loads,oldlds,tol)
 USE precision
 REAL(iwp),INTENT(IN)::loads(:),oldlds(:),tol
 LOGICAL::checkit
END FUNCTION checkit
!
SUBROUTINE chobac(kb,loads)
 USE precision
 REAL(iwp),INTENT(IN)::kb(:,:)
 REAL(iwp),INTENT(IN OUT)::loads(:)
END SUBROUTINE chobac
!
SUBROUTINE cholin(kb)
 USE precision
 REAL(iwp),INTENT(IN OUT)::kb(:,:)
END SUBROUTINE cholin
!
FUNCTION determinant(jac)
 USE precision
 REAL(iwp),INTENT(IN)::jac(:,:)
 REAL(iwp)::determinant
END FUNCTION determinant
!
FUNCTION eliminate(a,b)
 USE precision
 REAL(iwp),INTENT(IN OUT)::a(:,:),b(:)
 REAL(iwp)::eliminate(UBOUND(b,1)) 
END FUNCTION eliminate
!
SUBROUTINE fkdiag(kdiag,g)
 INTEGER,INTENT(IN)::g(:)
 INTEGER,INTENT(OUT)::kdiag(:)
END SUBROUTINE fkdiag
!
SUBROUTINE fsparv(kv,km,g,kdiag)
 USE precision
 INTEGER,INTENT(IN)::g(:),kdiag(:)
 REAL(iwp),INTENT(IN)::km(:,:)
 REAL(iwp),INTENT(OUT)::kv(:)
END SUBROUTINE fsparv
!
SUBROUTINE fun_der(fun,der,points,i)
 USE precision
 INTEGER,INTENT(IN)::i
 REAL(iwp),INTENT(IN)::points(:,:)
 REAL(iwp),INTENT(OUT)::der(:,:),fun(:)
END SUBROUTINE fun_der
!
SUBROUTINE gauss_laguerre(samp,wt)
 USE precision
 REAL(iwp),INTENT(OUT)::samp(:,:),wt(:)
END SUBROUTINE gauss_laguerre
!
SUBROUTINE gauss_legendre(samp,wt)
 USE precision
 REAL(iwp),INTENT(OUT)::samp(:,:),wt(:)
END SUBROUTINE gauss_legendre
!
FUNCTION inverse(matrix)
 USE precision
 REAL(iwp),INTENT(IN)::matrix(:,:)
 REAL(iwp)::inverse(UBOUND(matrix,1),UBOUND(matrix,2))
END FUNCTION inverse
!
SUBROUTINE ldlfor(a,b)
 USE precision
 REAL(iwp),INTENT(IN)::a(:,:)
 REAL(iwp),INTENT(IN OUT)::b(:)
END SUBROUTINE ldlfor
!
SUBROUTINE ldlt(a,d)
 USE precision
 REAL(iwp),INTENT(IN OUT)::a(:,:)
 REAL(iwp),INTENT(OUT)::d(:)
END SUBROUTINE ldlt
!
SUBROUTINE lufac(a,lower,upper)
 USE precision
 REAL(iwp),INTENT(IN)::a(:,:)
 REAL(iwp),INTENT(OUT)::lower(:,:),upper(:,:)
END SUBROUTINE lufac
!
SUBROUTINE lupfac(a,row)
 USE precision
 REAL(iwp),INTENT(IN OUT)::a(:,:)
 INTEGER,INTENT(OUT)::row(:)
END SUBROUTINE lupfac
!
SUBROUTINE lupsol(a,b,sol,row)
 USE precision
 REAL(iwp),INTENT(IN)::a(:,:)
 REAL(iwp),INTENT(IN OUT)::b(:)
 REAL(iwp),INTENT(OUT)::sol(:)
 INTEGER,INTENT(IN):: row(:)
END SUBROUTINE lupsol
!
SUBROUTINE newton_cotes(samp,wt)
 USE precision
 REAL(iwp),INTENT(OUT)::samp(:,:),wt(:)
END SUBROUTINE newton_cotes
!
FUNCTION norm(x)
 USE precision
 REAL(iwp),INTENT(IN)::x(:)
 REAL(iwp)::norm
END FUNCTION norm
!
SUBROUTINE spabac(a,b,kdiag)
 USE precision
 REAL(iwp),INTENT(IN)::a(:)
 REAL(iwp),INTENT(IN OUT)::b(:)
 INTEGER,INTENT(IN)::kdiag(:)
END SUBROUTINE spabac
!
SUBROUTINE sparin(a,kdiag)
 USE precision
 REAL(iwp),INTENT(IN OUT)::a(:)
 INTEGER,INTENT(IN)::kdiag(:)
END SUBROUTINE sparin
!
SUBROUTINE subbac(a,b)
 USE precision
 REAL(iwp),INTENT(IN)::a(:,:)
 REAL(iwp),INTENT(IN OUT)::b(:)
END SUBROUTINE subbac
!
SUBROUTINE subfor(a,b)
 USE precision
 REAL(iwp),INTENT(IN)::a(:,:)
 REAL(iwp),INTENT(IN OUT)::b(:)
END SUBROUTINE subfor
!
END INTERFACE
!
END MODULE nm_lib
