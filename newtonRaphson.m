function [root, iterations, history, converged, fCount, dfCount] = ...
    newtonRaphson(f, df, x0, tol, maxIter)
%NEWTONRAPHSON Find a root using the Newton-Raphson Method.

x = x0;
history = [];
converged = false;
fCount = 0;
dfCount = 0;
iterations = 0;
root = x0;

for k = 1:maxIter
    fx = f(x);
    dfx = df(x);
    fCount = fCount + 1;
    dfCount = dfCount + 1;

    if abs(fx) <= tol
        converged = true;
        iterations = k - 1;
        root = x;
        return;
    end

    if abs(dfx) < eps
        warning('Newton-Raphson stopped: derivative is zero or too small.');
        root = x;
        iterations = k - 1;
        return;
    end

    x = x - fx / dfx;
    root = x;
    iterations = k;
    history(k) = x; %#ok<AGROW>

    if ~isfinite(x)
        warning('Newton-Raphson stopped: non-finite approximation.');
        return;
    end
end

% Check the final approximation after the last update.
finalValue = f(root);
fCount = fCount + 1;
if abs(finalValue) <= tol
    converged = true;
end
end
