function detA = gauss_det(A)
    % Controlla se la matrice è quadrata
    [n, m] = size(A);
    if n ~= m
        error('La matrice deve essere quadrata');
    end

    detA = 1;
    for i = 1:n
        % Trova il massimo in valore assoluto nella colonna i da i a n
        [pivot, idx] = max(abs(A(i:n,i)));
        idx = idx + i - 1; % Calcola l'indice corretto

        % Se il pivot è zero, la matrice è singolare
        if pivot == 0
            detA = 0;
            return;
        end

        % Scambia le righe se necessario
        if idx ~= i
            A([i idx], :) = A([idx i], :);
            detA = -detA;
        end

        % Riduci le altre righe
        for j = i+1:n
            factor = A(j,i) / A(i,i);
            A(j,:) = A(j,:) - factor * A(i,:);
        end

        % Moltiplica il determinante per il pivot
        detA = detA * A(i,i);
    end
end

