function error_norm_table = errLagrange(x, y_interp, f)
    % Calculate the error between interpolated values and the original function
    error = abs(y_interp - f(x));

    % Calculate the error norm (Euclidean norm)
    error_norm = norm(error);

    % Create the error norm table
    error_norm_table = table(x', f(x)', y_interp', error', 'VariableNames', {'x', 'f(x)', 'yi', 'Errore'});
    error_norm_table.Properties.VariableUnits = {'', '', '', ''};
    error_norm_table.Properties.VariableDescriptions = {'xi', 'f(x)', 'yi', 'Errore'};

    % Print the error norm table
    disp(error_norm_table);

    % Plot the original function, interpolated values, and the error
    figure;
    hold on;
    plot(x, f(x), 'b-', 'LineWidth', 2, 'DisplayName', 'f(x)');
    plot(x, y_interp, 'r--', 'LineWidth', 2, 'DisplayName', 'Polinomio Inerpolato');
    plot(x, error, 'g-', 'LineWidth', 2, 'DisplayName', 'Errore');
    hold off;
    xlabel('x');
    ylabel('errore');
    title('Interpolazione di Lagrange');
    legend('Location', 'best');

    % Print the error norm
    fprintf('\nErrore Norma: %0.4f\n', error_norm);
end
