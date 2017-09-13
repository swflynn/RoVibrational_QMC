# Working Scripts
Collection of various programs I have written during the development of the project. 
All of these were working at the time of their development, however, the main code is the only version being maintained. 

### Hermite_Coef:
Fortran-90 script to determine the first 10 Hermite Polynomials Coefficients 
Code is adapted from J. -P. Moreau Code see : http://jean-pierre.moreau.pagesperso-orange.fr/Fortran/hermite_f90.txt
Script asks the user what degree polynomial they would like to calculate, and then pronts to screen all of the polynomial coeficients up to that degree. 

### permutations:
Fortran-90 script to determine the number of permutations available in a system with a d-dimensional wavefunction and a maximum excitation constraing of Vmax (the total number of excitations in the total wavefunction). 
Input the spatial dimension and maximum excitation, output Jmax, and v(d,Jmax) containing all of the permutations. 

### u_MC_integration:
Fortran-90 script that uses a uniformly distributed sobol sequence (generated by Fortran) to perform Monte Carlo Integration. 
User defines a function to be evaluated within the code.
#### Sobol.f90 
The Fortran-90 module used for Sobol Sequence Generation.
Taken from http://people.sc.fsu.edu/~jburkardt/f_src/sobol/sobol.html

### 1D_HO_matrix:
Fortran-90 script for calculating a 1D Harmonic Oscilator matrix (weighted by a Gaussian). 
The code allows users to define which degree polynomial to calculate up to for the HO Matrix elements, and uses Normally Distributed Sobol Points for quasi-Monte Carlo integration. 

### 1D_s_HO_matrix:
Fortran-90 script for calculating a 1D Harmonic Oscilator matrix (weighted by a Gaussian).
The code allows users to define which degree polynomial to calculate up to for the HO Matrix elements, and uses Normally Distributed Scrambled Sobol Points for quasi-Monte Carlo integration. 
The points must be generated externally (a matlab script has been attached for doing this) see
https://www.mathworks.com/help/stats/qrandset.scramble.html for matlab details. 

### nDOF:
Fortran-90 script for calculating any dimensional (D<10) any excitation (k<10) Harmonic Oscillator Potential Energy matrix elements. 
Modified hermite polynomials are used to compute the wavefunction, and quasi-monte carlo Sobol Sequences (normally distributed, Beasley-Springer-Moro) are used to perform numerical integration.
Eigenvalue and matrix element convergance as a function of iteration are available. 

