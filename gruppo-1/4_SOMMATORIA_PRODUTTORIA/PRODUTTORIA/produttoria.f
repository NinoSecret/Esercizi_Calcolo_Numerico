Made By Davide Ferrara and Antonio Segreto
	REAL N, K, R

	WRITE(*,*) 'Inserisci un numero reale N'
	READ(*,*) N
	R=1

	DO K=1, N
	 R=R*K 
     	ENDDO
	
	WRITE(*,*) R

	END PROGRAM