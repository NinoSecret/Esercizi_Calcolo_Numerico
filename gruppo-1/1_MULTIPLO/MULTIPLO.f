!Program by Davide Ferrara and Antonio Segreto
	PROGRAM MAIN

	INTEGER N,M
	LOGICAL R

!Input
	WRITE(*,*)'---IS MULTIPLE?---'
	WRITE(*,*)'Insert two integers N and M:'
	READ(*,*)N,M

!Logic
	CALL IS_MULTIPLE(N,M,R)
      
!Output
	IF (R) THEN
	 WRITE(*,*)N,' is multiple of',M
	ELSE
	 WRITE(*,*)N,' is not multiple of',M
	END IF 
	
      END

!If M/N*N is equal to M then N is multiple of M
	SUBROUTINE IS_MULTIPLE(N,M,R)
	 INTEGER N,M
	 LOGICAL R
	 
	 IF(M/N*N .EQ. M)THEN
	  R=.TRUE.
	 ELSE 
	  R=.FALSE.
	 ENDIF
      
	END