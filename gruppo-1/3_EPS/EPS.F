! PROGRAM BY DAVIDE FERRARA, ANTONINO SEG
	PROGRAM EPS_PRECISION

	REAL *8 EPS
	REAL *4 EPS_32, EPS_32_02, S
	EPS_32 = 1.0
	EPS_32_02 = 1.0
	EPS = 1.0
	S = 1.0 + EPS_32_02 


	DO WHILE(1.0 + EPS .GT. 1.0)
		EPS = EPS / 2
	END DO

	DO WHILE(1.0 + EPS_32 .GT. 1.0)
		EPS_32 = EPS_32 / 2
	END DO

	DO WHILE(S .GT. 1.0)
		EPS_32_02 = EPS_32_02 / 2
		S = 1.0 + EPS_32_02
	END DO

	PRINT *, "EPS 64:", EPS 

	PRINT *, "EPS 32 CASO 1: ", EPS_32

	PRINT *, "EPS 32 CASO 2: ", EPS_32_02

	END