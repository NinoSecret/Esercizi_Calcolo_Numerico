function error_norm_table = errLagrange(x, y_interp, f)
    % Calcola l'errore tra il valore interpolato e f(x)
    error = abs(f(x) - y_interp);

    % Calcola la norma dell'errore 
    error_norm = norma(error, 2);

    % Credo la tabella norma
    error_norm_table = table(x', f(x)', y_interp', error', 'VariableNames', {'x', 'f(x)', 'yi', 'Errore'});
    error_norm_table.Properties.VariableUnits = {'', '', '', ''};
    error_norm_table.Properties.VariableDescriptions = {'xi', 'f(x)', 'yi', 'Errore'};

    % Stampo la tabella
    disp(error_norm_table);

    % Plotto i valori di f(x), y_interp e error
    figure;
    hold on;
    
    %plot(x, f(x), 'b-', 'LineWidth', 2, 'DisplayName', 'f(x)');
    %plot(x, y_interp, 'r--', 'LineWidth', 2, 'DisplayName', 'Polinomio Inerpolato');
    plot(x, error, 'g-', 'LineWidth', 2, 'DisplayName', 'Errore');
    hold off;
    xlabel('x');
    ylabel('errore');
    title('Interpolazione di Lagrange');
    legend('Location', 'best');

    % Stampa errore Norma
    fprintf('\nErrore Norma: %0.4f\n', error_norm);
end
