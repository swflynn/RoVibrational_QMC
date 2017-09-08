MODULE NDOF_module
IMPLICIT NONE
INTEGER, PARAMETER :: d = 3           
INTEGER, PARAMETER :: Vmax = 9       
INTEGER :: Jmax
INTEGER, ALLOCATABLE :: v(:,:)

CONTAINS

SUBROUTINE permutation(d,Vmax)

Implicit none
INTEGER :: d, Vmax
INTEGER :: j,Vm(d),vv(d),k,v1,v2,v3,v4,v5,v6,v7,v8,v9

j=0
       Vm(1)=Vmax
       if(d>9) stop 'Spatial_dim>9'
        do v1=0,Vm(1)
           vv(1)=v1
           if(d>= 2) then
              Vm(2)=Vm(1)-vv(1)
              do v2=0,Vm(2)
                 vv(2)=v2
                 if(d>= 3) then
                    Vm(3)=Vm(2)-vv(2)
                    do v3=0,Vm(3)
                       vv(3)=v3
                       if(d>= 4) then
                          Vm(4)=Vm(3)-vv(3)
                          do v4=0,Vm(4)
                             vv(4)=v4
                             if(d>= 5) then
                                Vm(5)=Vm(4)-vv(4)
                                do v5=0,Vm(5)
                                   vv(5)=v5
                                   if(d>= 6) then
                                      Vm(6)=Vm(5)-vv(5)
                                      do v6=0,Vm(6)
                                         vv(6)=v6
                                         if(d>= 7) then
                                            Vm(7)=Vm(6)-vv(6)
                                            do v7=0,Vm(7)
                                               vv(7)=v7
                                               if(d>= 8) then
                                                  Vm(8)=Vm(7)-vv(7)
                                                  do v8=0,Vm(8)
                                                     vv(8)=v8
                                                     if(d== 9) then
                                                        Vm(9)=Vm(8)-vv(8)
                                                        do v9=0,Vm(9)
                                                           vv(9)=v9
                                                           j=j+1
                                                        enddo
                                                     else
                                                        j=j+1
                                                     endif
                                                  enddo
                                               else
                                                  j=j+1
                                               endif
                                            enddo
                                         else
                                            j=j+1
                                         endif
                                      enddo
                                   else
                                      j=j+1
                                   endif
                                enddo
                             else 
                                j=j+1 
                             endif
                          enddo
                       else
                          j=j+1
                       endif
                    enddo
                 else
                    j=j+1
                 endif
              enddo
           else
              j=j+1
           endif
        enddo 
      Jmax = j
!      WRITE(*,*) 'Jmax = ', Jmax
!==================With Jmax, Run again to determine v(d,Jmax)===========================!
ALLOCATE(v(d,Jmax))

j=0
 Vm(1)=Vmax
 if(d>9) stop 'Spatial_dim>9'
  do v1=0,Vm(1)
     vv(1)=v1
     if(d>= 2) then
        Vm(2)=Vm(1)-vv(1)
        do v2=0,Vm(2)
           vv(2)=v2
           if(d>= 3) then
              Vm(3)=Vm(2)-vv(2)
              do v3=0,Vm(3)
                 vv(3)=v3
                 if(d>= 4) then
                    Vm(4)=Vm(3)-vv(3)
                    do v4=0,Vm(4)
                       vv(4)=v4
                       if(d>= 5) then
                          Vm(5)=Vm(4)-vv(4)
                          do v5=0,Vm(5)
                             vv(5)=v5
                             if(d>= 6) then
                                Vm(6)=Vm(5)-vv(5)
                                do v6=0,Vm(6)
                                   vv(6)=v6
                                   if(d>= 7) then
                                      Vm(7)=Vm(6)-vv(6)
                                      do v7=0,Vm(7)
                                         vv(7)=v7
                                         if(d>= 8) then
                                            Vm(8)=Vm(7)-vv(7)
                                            do v8=0,Vm(8)
                                               vv(8)=v8
                                               if(d== 9) then
                                                  Vm(9)=Vm(8)-vv(8)
                                                  do v9=0,Vm(9)
                                                     vv(9)=v9
                                                     j=j+1
                                                     do k=1,d
                                                        v(k,j)=vv(k)       
                                                     enddo
                                                  enddo
                                               else
                                                  j=j+1
                                                  do k=1,d
                                                    v(k,j)=vv(k)           
                                                  enddo
                                               endif
                                            enddo
                                         else
                                            j=j+1
                                            do k=1,d
                                               v(k,j)=vv(k)                
                                            enddo
                                         endif
                                      enddo
                                   else
                                      j=j+1
                                      do k=1,d
                                         v(k,j)=vv(k)                      
                                      enddo
                                   endif
                                enddo
                             else
                                j=j+1
                                do k=1,d
                                   v(k,j)=vv(k)                            
                                enddo
                             endif
                          enddo
                       else 
                          j=j+1 
                          do k=1,d
                             v(k,j)=vv(k)                                  
                          enddo
                       endif
                    enddo
                 else
                    j=j+1
                    do k=1,d
                       v(k,j)=vv(k)                                       
                    enddo
                 endif
              enddo
           else
              j=j+1
              do k=1,d
                 v(k,j)=vv(k)                                              
              enddo
           endif
        enddo
     else
        j=j+1
        do k=1,d
           v(k,j)=vv(k)                                                    
        enddo
     endif
  enddo 
!write(*,*) v   

END SUBROUTINE permutation

END MODULE NDOF_module

PROGRAM NDOF
USE NDOF_module

IMPLICIT NONE
REAL :: initial_time, final_time
DOUBLE PRECISION :: B
DOUBLE PRECISION, ALLOCATABLE :: scrambled_z(:), herm(:,:), A(:,:,:), U(:,:), C(:,:),FV1(:),FV2(:),eigenvalues(:)
INTEGER :: i, j, j1, k, m, n, IERR
INTEGER :: Nsobol
!==========================================================================================!
!===============================Variables to run ssobol.f==================================!
!==========================================================================================!
INTEGER :: TAUS, IFLAG, MAX, SAM
LOGICAL :: FLAG(2)

CALL CPU_TIME(initial_time)

Nsobol = 10000000
SAM = 1
MAX = 30
IFLAG = 3

ALLOCATE(scrambled_z(d), herm(0:Vmax,d), A(0:Vmax,0:Vmax,d))

CALL permutation(d,Vmax)
ALLOCATE(U(Jmax,Jmax),C(Jmax,Jmax),FV1(Jmax),FV2(Jmax),eigenvalues(Jmax))         
U=0d0
!========================================================================================!
! Make herm up to deg, we have redefined the Hermite Polynomials coeficients
!========================================================================================!
OPEN(UNIT=80, FILE='matrix.dat')
OPEN(UNIT=81, FILE='eigenvalues.dat')
CALL INSSOBL(FLAG,d,Nsobol,TAUS,scrambled_z,MAX,IFLAG)
DO i = 1, Nsobol
  CALL GOSSOBL(scrambled_z)
  CALL sobol_stdnormal(d, scrambled_z)
  scrambled_z = scrambled_z/SQRT(2.)    ! Factor from definition of normal distribution
  herm(0,:) = 1.0                       
  herm(1,:) = SQRT(2.)*scrambled_z(:)       
  DO j = 2,Vmax      
    herm(j,:) = (SQRT(2./j)*scrambled_z(:)*herm(j-1,:)) - (SQRT(((j-1d0)/j))*herm(j-2,:))
  END DO
!=================================Evaluate Herm * Herm =================================!
! Make a Matrix A that evaluates herm(deg)*herm(deg) 
! A is a colllection of 1D calculations, contains all of the polynomial products
!========================================================================================!
  DO m=0,Vmax
    DO n=0,Vmax
      A(m,n,:) = herm(m,:)*herm(n,:)
    END DO
  END DO
!=================================Evaluate Matrix Elements =================================!
! Matrix U will contains the Potential Energy Matrix Elements 
!===========================================================================================!
  DO j=1,Jmax         
    DO j1=j,Jmax 
      B=A(v(1,j),v(1,j1),1)
      DO k=2,d
        B=B*A(v(k,j),v(k,j1),k)
      END DO
      U(j1,j) = U(j1,j) + B
    END DO
  END DO

  if(mod(i,100000)==0) then       ! set your convergence analysis criteria
     C=U/i
      WRITE(80,*) i, C 
   flush(80)
   call RS(Jmax,Jmax,C,eigenvalues,0,B,FV1,FV2,IERR) 
   write(81,*) i, ABS(1-eigenvalues(:))
  flush(81)
endif
END DO ! This closes off loop over sobol points
CLOSE(UNIT=80)
CLOSE(UNIT=81)

CALL CPU_TIME(final_time)
WRITE(*,*) 'Total Time:', final_time - initial_time
OPEN(UNIT=83, FILE='output.dat')
WRITE(83,*) 'Scramble method= ', IFLAG
WRITE(83,*) 'Sobol Numbers = ', Nsobol
WRITE(83,*) 'spacial dimensions = ', d
WRITE(83,*) 'Maximum Excitation = ', Vmax
WRITE(83,*) 'Jmax = ', Jmax
WRITE(83,*) 'This calculation ran for (s): ', final_time - initial_time
CLOSE(UNIT=83)

END PROGRAM NDOF
