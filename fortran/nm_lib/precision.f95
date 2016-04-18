MODULE precision
 INTEGER,PARAMETER::iwp=SELECTED_REAL_KIND(15,300)
!
! SELECTED_REAL_KIND Function
!
! Description: Kind type parameter of a REAL data type with decimal precision
!              of at least p digits and a decimal exponent range of at least r
!
! Syntax: SELECTED_REAL_KIND(p,r)
!
! Arguments: p and r are both scalar INTEGERs
!    
! Result: The results is of type default INTEGER. Its value is equal to the kind
!         type parameter of the REAL data type with decimal precision of at least
!         p digits and decimal exponent range of at least r. The result is -1 if
!         the precision is not available, -2 if the range is not available, and
!         -3 if neither is available. If more than one kind is available, the value
!         returned is the value of the kind type parameter of the kind with the
!         smallest decimal precision.
!
! Example: REAL(SELECTED_REAL_KIND(p,r))::a,b
!          a and b are of a data type with a decimal range of -1000 to 1000 and
!          a precision of at least 3 decimal digits.
!
END MODULE precision
