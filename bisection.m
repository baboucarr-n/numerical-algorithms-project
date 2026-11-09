function [root, iterations, history, converged, fCount, dfCount] = ...
    bisection(f, a, b, tol, maxIter)
%BISECTION Find a root using the Bisection Method.

fa = f(a);
fb = f(b);
fCount = 2;
dfCount = 0;
history = [];
converged = false;
root = NaN;
iterations = 0;

if fa == 0
    root = a;
    converged = true;
    return;
elseif fb == 0
    root = b;
    converged = true;
    return;
elseif fa * fb > 0
    error('Bisection requires f(a) and f(b) to have opposite signs.');
end

for k = 1:maxIter
    root = (a + b) / 2;
    fr = f(root);
    fCount = fCount + 1;
    iterations = k;
    history(k) = root; %#ok<AGROW>

    if abs(fr) <= tol
        converged = true;
        break;
    end

    if fa * fr < 0
        b = root;
        fb = fr;
    else
        a = root;
        fa = fr;
    end
end
end
