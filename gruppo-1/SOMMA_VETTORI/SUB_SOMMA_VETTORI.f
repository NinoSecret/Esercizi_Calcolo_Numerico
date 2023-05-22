      SUBROUTINE SUB_SOMMA_VETTORI (N,VX,VY,VR
	
      INTEGER N
      REAL VX(N),VY(N),VR(N)
	
      DO I=1,N
	 VR(I) = VX(I)+VY(I)
	END DO
	
      END