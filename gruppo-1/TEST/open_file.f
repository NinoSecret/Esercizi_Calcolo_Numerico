	PROGRAM READ_FILE
      INTEGER I, N
      PARAMETER (N=100)
      REAL VECTOR(N)
      OPEN(1,FILE='data.dat',STATUS='OLD')
      DO I=1,N
         READ(1,*) VECTOR(I)
      END DO
      CLOSE(1)
      WRITE(*,*)VECTOR
	END PROGRAM
