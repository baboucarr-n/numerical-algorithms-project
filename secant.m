function [root, iterations, history, converged, fCount, dfCount] = ...
    secant(f, x0, x1, tol, maxIter)
%SECANT Find a root using the Secant Method.

f0 = f(x0);
f1 = f(x1);
fCount = 2;
dfCount = 0;
history = [x0, x1];
converged = false;
root = x1;
iterations = 0;

if abs(f0) <= tol
    root = x0;
    converged = true;
    history = x0;
    return;
elseif abs(f1) <= tol
    root = x1;
    converged = true;
    return;
end

for k = 1:maxIter
    denominator = f1 - f0;

    if abs(denominator) < eps
        warning('Secant stopped: denominator is zero or too small.');
        return;
    end

    x2 = x1 - f1 * (x1 - x0) / denominator;
    iterations = k;
    root = x2;
    history(end + 1) = x2; %#ok<AGROW>

    if ~isfinite(x2)
        warning('Secant stopped: non-finite approximation.');
        return;
    end

    f2 = f(x2);
    fCount = fCount + 1;

    if abs(f2) <= tol
        converged = true;
        break;
    end

    x0 = x1;
    f0 = f1;
    x1 = x2;
    f1 = f2;
end
end
