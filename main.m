% Comparison of Numerical Algorithms
% Bisection, Newton-Raphson and Secant methods
% Group 10 - Computational Mathematics

clear;
clc;
close all;

tol = 1e-10;
maxIter = 100;
repeatCount = 30; % Repeated runs make timing less sensitive to noise.

% Test equations and reference roots.
tests(1).name = 'x^2 - 2';
tests(1).f = @(x) x.^2 - 2;
tests(1).df = @(x) 2.*x;
tests(1).reference = sqrt(2);
tests(1).a = 1;
tests(1).b = 2;
tests(1).x0 = 1.5;
tests(1).x1 = 1;
tests(1).x2 = 2;

tests(2).name = 'x^3 - x - 2';
tests(2).f = @(x) x.^3 - x - 2;
tests(2).df = @(x) 3.*x.^2 - 1;
tests(2).reference = 1.5213797068045676;
tests(2).a = 1;
tests(2).b = 2;
tests(2).x0 = 1.5;
tests(2).x1 = 1;
tests(2).x2 = 2;

tests(3).name = 'cos(x) - x';
tests(3).f = @(x) cos(x) - x;
tests(3).df = @(x) -sin(x) - 1;
tests(3).reference = 0.7390851332151607;
tests(3).a = 0;
tests(3).b = 1;
tests(3).x0 = 0.5;
tests(3).x1 = 0;
tests(3).x2 = 1;

methodNames = {'Bisection', 'Newton-Raphson', 'Secant'};
results = table();

fprintf('NUMERICAL ALGORITHM COMPARISON\n');
fprintf('Tolerance: %.1e | Maximum iterations: %d\n\n', tol, maxIter);

for t = 1:length(tests)
    f = tests(t).f;
    df = tests(t).df;

    % Run each method once to collect its numerical results.
    [r1, it1, h1, ok1, fc1, dc1] = ...
        bisection(f, tests(t).a, tests(t).b, tol, maxIter);

    [r2, it2, h2, ok2, fc2, dc2] = ...
        newtonRaphson(f, df, tests(t).x0, tol, maxIter);

    [r3, it3, h3, ok3, fc3, dc3] = ...
        secant(f, tests(t).x1, tests(t).x2, tol, maxIter);

    roots = [r1, r2, r3];
    iterations = [it1, it2, it3];
    converged = [ok1, ok2, ok3];
    fEvals = [fc1, fc2, fc3];
    dfEvals = [dc1, dc2, dc3];
    histories = {h1, h2, h3};

    % Measure elapsed time over repeated runs. The median is reported.
    times = zeros(1, 3);
    for k = 1:repeatCount
        tic;
        bisection(f, tests(t).a, tests(t).b, tol, maxIter);
        times(1) = times(1) + toc;

        tic;
        newtonRaphson(f, df, tests(t).x0, tol, maxIter);
        times(2) = times(2) + toc;

        tic;
        secant(f, tests(t).x1, tests(t).x2, tol, maxIter);
        times(3) = times(3) + toc;
    end
    times = times ./ repeatCount;

    fprintf('TEST %d: %s\n', t, tests(t).name);
    fprintf('%-18s %-16s %-12s %-12s %-12s %-12s\n', ...
        'Method', 'Approx. root', 'Iterations', 'Abs. error', ...
        'Residual', 'Time (s)');

    for m = 1:3
        if converged(m)
            rootError = abs(roots(m) - tests(t).reference);
            residual = abs(f(roots(m)));
            fprintf('%-18s %-16.10f %-12d %-12.3e %-12.3e %-12.3e\n', ...
                methodNames{m}, roots(m), iterations(m), rootError, ...
                residual, times(m));
        else
            rootError = NaN;
            residual = abs(f(roots(m)));
            fprintf('%-18s %-16.10f %-12d %-12s %-12.3e %-12.3e\n', ...
                methodNames{m}, roots(m), iterations(m), 'No', ...
                residual, times(m));
        end

        row = table({tests(t).name}, {methodNames{m}}, roots(m), ...
            iterations(m), rootError, residual, fEvals(m), dfEvals(m), ...
            times(m), converged(m), ...
            'VariableNames', {'TestEquation','Method','ApproxRoot', ...
            'Iterations','AbsoluteError','Residual','FunctionEvaluations', ...
            'DerivativeEvaluations','AverageTimeSeconds','Converged'});
        results = [results; row]; %#ok<AGROW>
    end

    % Plot absolute error by iteration for each method.
    figure;
    hold on;
    plot(1:length(h1), abs(h1 - tests(t).reference), '-o');
    plot(1:length(h2), abs(h2 - tests(t).reference), '-s');
    plot(1:length(h3), abs(h3 - tests(t).reference), '-^');
    set(gca, 'YScale', 'log');
    xlabel('Iteration');
    ylabel('Absolute error (log scale)');
    title(['Convergence comparison: ', tests(t).name]);
    legend(methodNames, 'Location', 'best');
    grid on;
    hold off;
end

% Save numerical results for the report.
writetable(results, 'comparison_results.csv');
disp(' ');
disp('Full results saved in comparison_results.csv');
disp(results);
