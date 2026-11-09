# Comparison of Numerical Algorithms: Accuracy, Speed and Computational Complexity

**Course:** Computational Mathematics  
**Group:** 10  
**Project Topic:** Comparison of Numerical Algorithms: Accuracy, Speed and Computational Complexity

## 1. Project Overview

This project examines and compares three numerical algorithms used to approximate solutions to nonlinear equations:

1. Bisection Method
2. Newton-Raphson Method
3. Secant Method

The main objective is to investigate how these algorithms differ in terms of accuracy, convergence, computational effort and execution time when solving the same mathematical problems.

The algorithms are implemented in MATLAB and evaluated using selected nonlinear equations. Their performance is examined through numerical experiments and comparisons.

## 2. Research Objectives

The project aims to:

- Implement the Bisection, Newton-Raphson and Secant methods in MATLAB.
- Evaluate the accuracy of the approximated roots.
- Examine the convergence behaviour of each algorithm.
- Compare the number of iterations required by each method.
- Measure and compare execution times.
- Examine computational effort through function and derivative evaluations.
- Identify the strengths and limitations of each method.

## 3. Numerical Methods

### 3.1 Bisection Method

The Bisection Method is a bracketing method that repeatedly divides an interval into two halves to locate a root.

It requires a continuous function and an initial interval `[a, b]` where the function has opposite signs at the endpoints:

\[
f(a)f(b)<0
\]

The midpoint is calculated using:

\[
c=\frac{a+b}{2}
\]

The interval is then reduced based on the sign of the function at the midpoint.

**Characteristics:**
- Does not require differentiation.
- Requires an interval that brackets a root.
- Has linear convergence under standard assumptions.
- Generally reliable when its bracketing conditions are satisfied.

### 3.2 Newton-Raphson Method

The Newton-Raphson Method uses the derivative of a function to improve an initial approximation of a root.

Its iteration formula is:

\[
x_{n+1}=x_n-\frac{f(x_n)}{f'(x_n)}
\]

**Characteristics:**
- Requires a derivative.
- Uses one initial approximation.
- Can converge rapidly near a suitable root.
- Has quadratic local convergence under appropriate conditions.
- May fail with a poor initial guess or a zero or very small derivative.

### 3.3 Secant Method

The Secant Method approximates the derivative using two previous approximations instead of calculating the derivative directly.

Its iteration formula is:

\[
x_{n+1}=x_n-
\frac{f(x_n)(x_n-x_{n-1})}
{f(x_n)-f(x_{n-1})}
\]

**Characteristics:**
- Does not require an explicit derivative.
- Requires two initial approximations.
- Generally has superlinear convergence under suitable conditions.
- Can encounter problems when the denominator becomes zero or very small.

## 4. Test Equations

The three methods are evaluated using the following nonlinear equations.

| Test | Equation | Reference Root |
|---|---|---:|
| 1 | \(x^2-2=0\) | 1.4142135624 |
| 2 | \(x^3-x-2=0\) | 1.5213797068 |
| 3 | \(\cos(x)-x=0\) | 0.7390851332 |

The reference roots are used to calculate the absolute error of each numerical approximation.

All three algorithms are tested against the same equations to make their results comparable.

## 5. Experimental Settings

The implementation uses the following settings:

| Parameter | Value |
|---|---:|
| Tolerance | \(10^{-10}\) |
| Maximum Iterations | 100 |
| Timing Repetitions | 30 |

### Initial Approximations

| Method | Initial Values |
|---|---|
| Bisection | An interval `[a, b]` |
| Newton-Raphson | One initial guess |
| Secant | Two initial guesses |

The initial values are defined separately for each test equation in `main.m`.

## 6. Performance Evaluation

The algorithms are compared using the following measurements.

### 6.1 Absolute Error

Absolute error measures the difference between the computed root and its reference value.

\[
E_a=|x_{\text{computed}}-x_{\text{reference}}|
\]

A smaller absolute error indicates a closer approximation to the reference root.

### 6.2 Residual

The residual measures how closely the computed root satisfies the original equation.

\[
R=|f(x_{\text{computed}})|
\]

A smaller residual indicates that the computed value satisfies the equation more closely. Residual and absolute root error are related but are not identical.

### 6.3 Number of Iterations

This records how many updates an algorithm performs before meeting its stopping condition or reaching the maximum iteration limit.

### 6.4 Execution Time

Execution time measures how long an algorithm takes to complete.

Each method is executed repeatedly, and the average measured execution time is recorded.

Small timing differences should be interpreted carefully because computer workload and other system conditions can affect measurements.

### 6.5 Function and Derivative Evaluations

The implementation also counts function evaluations and derivative evaluations.

This helps examine the computational work required by each algorithm, rather than relying only on iteration counts.

## 7. Project Structure

```text
numerical-algorithms-comparison/
│
├── main.m
├── bisection.m
├── newtonRaphson.m
├── secant.m
├── README.md
│
└── comparison_results.csv
```

| File | Description |
|---|---|
| `main.m` | Runs the experiments and generates comparisons. |
| `bisection.m` | Implementation of the Bisection Method. |
| `newtonRaphson.m` | Implementation of the Newton-Raphson Method. |
| `secant.m` | Implementation of the Secant Method. |
| `README.md` | Project documentation and instructions. |
| `comparison_results.csv` | Generated numerical results. |

The CSV file is generated when the main script runs successfully.

## 8. Requirements

- MATLAB with support for function handles, user-defined functions, tables and plotting.
- The project source files.
- A computer capable of running MATLAB.

## 9. How to Run the Project

1. Clone or download this repository.
2. Extract the project files if downloaded as a ZIP archive.
3. Open MATLAB.
4. Navigate to the project directory.
5. Ensure all four `.m` files are in the same directory.
6. Open the MATLAB Command Window.
7. Run the main script:

```matlab
main
```

The program will:

- Execute all three numerical methods.
- Test them against the three nonlinear equations.
- Display the numerical comparison in the Command Window.
- Generate convergence graphs.
- Save the results in `comparison_results.csv`.

## 10. Understanding the Output

The program produces comparison results containing:

- Test equation.
- Numerical method.
- Approximate root.
- Number of iterations.
- Absolute error.
- Residual.
- Function evaluations.
- Derivative evaluations.
- Average execution time.
- Convergence status.

The convergence graphs illustrate how the absolute error changes across iterations for each algorithm.

The generated results should be used to discuss the differences between the methods. No algorithm should be assumed to be the fastest or most accurate before examining the actual experimental results.

## 11. Limitations

- The experiments use only three nonlinear equations.
- Performance can change depending on the initial approximations.
- Execution times can vary depending on the computer and its current workload.
- Reference roots are numerical approximations used for comparison.
- Successful convergence on these test equations does not guarantee convergence for every nonlinear equation.

## 12. Contributions

My contribution to the project focuses on the computational implementation and final integration of the research work.

**MATLAB Implementation and Experimental Setup**
- Implemented the Bisection, Newton-Raphson and Secant methods in MATLAB.
- Prepared the test equations and initial approximations.
- Developed the experimental setup for comparing accuracy, convergence and computational performance.
- Prepared the result collection and visualization components.

**Final Compilation and Integration**
- Volunteered to coordinate the final compilation of the research report.
- Responsible for bringing together the individual contributions from group members.
- Responsible for reviewing the consistency and organization of the final document.
- Responsible for compiling and checking the references and formatting before submission.

## 13. Conclusion

This project provides a practical comparison of three widely used numerical root-finding algorithms.

By implementing the methods in MATLAB and evaluating their accuracy, convergence behaviour, iteration counts and computational effort, the project aims to demonstrate that different numerical algorithms have different strengths and limitations.

The final conclusions will be based on the actual experimental results.

## 14. Academic Note

This repository contains the MATLAB implementation and experimental setup supporting the group's Computational Mathematics research project. The implementation and numerical findings should be considered alongside the mathematical theory and analysis presented in the final research report.
