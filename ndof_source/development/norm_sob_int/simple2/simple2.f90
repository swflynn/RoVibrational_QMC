PROGRAM int_test
  USE sobol
  IMPLICIT NONE

  INTEGER :: d, Nsobol
  INTEGER :: n, i, j, k, m, o, p
  INTEGER, PARAMETER :: deg = 10       !polynomial we want to calculate up to
  INTEGER*8 :: skip
  DOUBLE PRECISION, ALLOCATABLE:: norm(:,:)
  DOUBLE PRECISION, DIMENSION(1:10) :: herm, coef
  DOUBLE PRECISION, DIMENSION(1:10, 1:10) :: A

  d = 1                           
  Nsobol = 1000000
  skip = 1000

  ALLOCATE (norm(d,Nsobol))

A=0d0
!=========================Get each sobol pointpoint=========================!
  DO n = 1, Nsobol                
    CALL sobol_stdnormal(d,skip,norm(:,n))
  END DO
  norm=norm/SQRT(2.)      
!=========================Get each sobol pointpoint=========================!

!=========================Get each wavefn coef.=========================!
  coef(1) = 1
  coef(2) = 1.0 / (SQRT(2.0))
  DO p = 3,deg
    coef(p) = coef(p-1)*(1 /SQRT(2.0*REAL(p-1)))
  END DO
 

!=========================Get each wavefn coef.=========================!

  OPEN(UNIT=9, FILE='converge.dat')

!=========================evaluate each sobol point=========================!
  DO i = 1, Nsobol              
        herm(1) = 1.0             
        herm(2) = 2.0*norm(1,i)       
        
      !======================evaluate each herm for a single sobol point=========================!
        DO j = 3,deg      
             herm(j) =(2.0*norm(d,i)*herm(j-1)) - (2.0*(j-2)*herm(j-2))
        END DO
      !=====================evaluate each herm for a single sobol point=========================!
      
      !=====================evaluate each matrix element for a single point=========================!
        DO k = 1, deg
             DO m = 1, deg
                 A(k,m) = A(k,m) + coef(k)*herm(k)*coef(m)*herm(m)
             END DO
        END DO
      !=====================evaluate each matrix element for a single point=========================!


! add in function to print results as a function of N

  IF (mod(i,1000)==0) THEN
    WRITE(9,*) A(4,4) / REAL(i), A(6,6)/REAL(i), A(8,8)/REAL(i), A(10,10)/REAL(i), & 
 &             A(1,6) / REAL(i), A(1,10)/REAL(i), A(6,1)/REAL(i), A(10,1)/REAL(i), &
 &             A(7,3) / REAL(i), A(6,8)/REAL(i), A(8,10)/REAL(i), A(9,4)/REAL(i)
  END IF

  END DO

  CLOSE(9)
!=========================evaluate each sobol point=========================!
  A = A / Nsobol
  
!=========================write out matrix elements=========================!
  OPEN(UNIT=10, FILE='data.dat')
  do o=1,deg
     Write(10,*) A(1:deg,o)
  enddo
  CLOSE(10)
!=========================write out matrix elements=========================!
  

END PROGRAM int_test