# Scripts
Collection of various programs written during project development.

### Q-Space-Calculations:
Original formulation of the project using coordinate space (opposed to normal mode space).
The 1-Dimensional calculation gives accurate results, however, the two-dimensional case (and subsequentally the equations) are off by a factor that was never corrected.
The factor must be in the potential energy evaluations (the overlap and kinetic matricies can be computed analytically and were verified).
The remainder of the project uses the normal-mode coordinates formulation. 
These codes are for reference only, and would need to be corrected before implementation. 

### 1D-Potential:

### 2D-Potential:

# Open Source Codes
The following codes have been useful during this project.
Refer to the original source code and documentation for more details.
Many thanks to all the authors who have made these codes available (special thanks to John Burkardt for his knowledge on quasi-random sequences and their applications). 

## Sobol.f90 
Fortran-90 module for generating standard Sobol Sequences. 

http://people.sc.fsu.edu/~jburkardt/f_src/sobol/sobol.html

## ACM Collected Algorithms
A collection of various algorithms, notably the various quasi-random sequence generators (647, 659)

http://calgo.acm.org/ 

## MCQMC Wiki Page
Public Software containing MC, QMC, MCMC programs.

http://roth.cs.kuleuven.be/wiki/Main_Page 