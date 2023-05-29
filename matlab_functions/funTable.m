function fTable = funTable(y, a, b, n, formula)


switch formula
    case 1
        % Genera il vettore di punti equidistanti tra a e b
        x = linspace(a, b, n);
        
        % Calcola i valori della funzione y in ciascun punto della griglia
        f = y(x);
        
        % Crea la matrice dei punti (x, y(x))
        fTable = [x; f]';
    
end

