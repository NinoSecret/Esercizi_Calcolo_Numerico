	PROGRAM TAB_FUNZ
	REAL x(0:100), y(0:100)
 	
      WRITE(*,*) 'Inserisci gli estremi dell''intervallo (a e b) e il va
	.lore n'
      READ(*,*) a,b,n
	
      n=n-1
	h=(b-a)/n
	x(0)=a
	y(0)=f(x(0))

ciclo fino al penultimo
	DO i=1,n-1
	 x(i)=x(i-1)+h
	 y(i)=f(x(i))
	ENDDO

ultimo punto (uguale a b per definizione)	
	x(n)=b
	y(n)=f(x(n))

Fase di output dei risultati, come elenco di coppie ascissa,ordinata
	DO i=0,n
scrittura nel terminale
	 WRITE(*,*) x(i),y(i)
scrittura su file
	 WRITE(3,*) x(i),y(i)
	ENDDO

	END

	REAL FUNCTION f(x)
a differenza delle subroutine ricalca le funzioni matematiche (restituisce un solo valore scalare)
	f=1/(25*x*x+1)
Definizione della funzione di Runge
      END