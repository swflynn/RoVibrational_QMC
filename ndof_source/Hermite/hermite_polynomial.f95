! Code to generate Hermite Polynomiali coeficients, only for polynomial = 10

PROGRAM Hermite
  IMPLICIT NONE

  REAL*8 :: A(0:10)
  REAL*8 :: B(0:10,0:10)
  INTEGER :: degree,k

   degree = 5
     WRITE(*,25) degree

     CALL Hermite_Coeff(degree,A,B)

     DO k = 0, degree
       WRITE(*,50) k, A(k)  
     END DO 

   stop

!Pretty formatting for writing coefficients to screen not necessary
25 format('Coefficients for Hermite Polynomial',i2/)
50 format('A(',i2,') = ',f10.0)

END PROGRAM HERMITE

SUBROUTINE Hermite_Coeff(degree,A,B)  
  IMPLICIT NONE
  INTEGER i,j,degree
  REAL*8  A(0:10), B(0:10,0:10)
  B(0,0)=1.D0 ; B(1,0)=0.D0 ; B(1,1)=2.D0

! my comments
 IF (degree == 0) THEN
   A(0) = 1
   RETURN 

 ELSE IF (degree == 1) THEN
   A(0) = 0
   A(1) = 2
   RETURN 

  ELSE IF (degree>1) THEN 
    DO i = 2, degree
      B(i,0)=-2.D0*(i-1)*B(i-2,0)
      DO j = 1, i

!Basic recursion relation

        B(i,j)=2.D0*B(i-1,j-1)-2.D0*(i-1)*B(i-2,j)
      END dO 
    END DO 
    DO i = 0, degree
      A(i)=B(degree,i)
    END DO
  END IF
  RETURN 

END SUBROUTINE Hermite_Coeff
