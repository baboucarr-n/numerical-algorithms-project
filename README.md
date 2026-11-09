# Comparison of Numerical Algorithms: Accuracy, Speed and Computational Complexity

## 1. Overview

This project compares three numerical algorithms used to solve nonlinear equations: the **Bisection Method**, **Newton-Raphson Method**, and **Secant Method**.

The aim is to investigate how these methods perform in terms of accuracy, convergence, iteration count, execution time, and computational complexity.

The algorithms are implemented in MATLAB and tested using different nonlinear equations. Their results are then compared to understand their strengths, limitations, and suitability for solving numerical problems.

## 2. Objectives

The main objectives of this project are to:

- Implement the Bisection, Newton-Raphson, and Secant methods in MATLAB.
- Apply the algorithms to selected nonlinear equations.
- Compare the accuracy of the computed roots.
- Examine the convergence behaviour and number of iterations required by each method.
- Measure and compare their execution times.
- Discuss the computational complexity and limitations of each algorithm.

## 3. Numerical Algorithms

### 3.1 Bisection Method

The Bisection Method is a numerical technique used to find a root of a continuous function within an interval where the function changes sign.

It repeatedly divides the interval into two equal parts and selects the subinterval that contains the root.

The method is reliable when the initial interval satisfies the sign-change condition:

$$
f(a)f(b) < 0
$$

Its main advantage is reliability, although it generally converges more slowly than Newton-Raphson and Secant methods.

### 3.2 Newton-Raphson Method

The Newton-Raphson Method uses the derivative of a function to obtain successive approximations of a root.

Its iteration formula is:

$$
x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}
$$

The method can converge very quickly when the initial approximation is sufficiently close to a simple root.

However, it requires the derivative of the function and may fail when the derivative is zero or very close to zero.

### 3.3 Secant Method

The Secant Method is similar to Newton-Raphson, but it approximates the derivative using two previous approximations.

Its iteration formula is:

$$
x_{n+1} = x_n -
\frac{f(x_n)(x_n-x_{n-1})}
{f(x_n)-f(x_{n-1})}
$$

Unlike Newton-Raphson, it does not require an explicit derivative.

It generally converges faster than the Bisection Method but does not always guarantee convergence.

## 4. Test Equations

The algorithms are tested using three nonlinear equations.

| Test | Equation | Initial Values |
|---|---|---|
| 1 | \(f(x)=x^2-2\) | Bisection: [1, 2], Newton: 1.5, Secant: 1, 2 |
| 2 | \(f(x)=x^3-x-2\) | Bisection: [1, 2], Newton: 1.5, Secant: 1, 2 |
| 3 | \(f(x)=\cos(x)-x\) | Bisection: [0, 1], Newton: 0.5, Secant: 0, 1 |

The reference roots used for calculating errors are approximately:

| Test | Reference Root |
|---|---:|
| \(x^2-2=0\) | 1.414213562373095 |
| \(x^3-x-2=0\) | 1.521379706804568 |
| \(\cos(x)-x=0\) | 0.739085133215161 |

These reference values provide a basis for evaluating the accuracy of the computed approximations.

## 5. Experimental Settings

To maintain consistency during the comparison, the following settings are used:

| Parameter | Value |
|---|---:|
| Tolerance | \(10^{-10}\) |
| Maximum iterations | 100 |
| Timing repetitions | 30 |
| Programming environment | MATLAB |

Each algorithm is tested using the same tolerance and maximum iteration limit.

The execution time is measured over repeated runs to calculate an average.

## 6. Performance Measures

The algorithms are evaluated using the following measures.

### 6.1 Absolute Error

Absolute error measures the difference between the computed root and its reference value.

$$
E_a = |x_{\text{computed}} - x_{\text{reference}}|
$$

A smaller absolute error indicates a closer approximation to the reference root.

### 6.2 Relative Error

Relative error measures the absolute error in relation to the magnitude of the reference root.

$$
E_r = \frac{|x_{\text{computed}} - x_{\text{reference}}|}
{|x_{\text{reference}}|}
$$

It helps compare the accuracy of approximations across problems with different root magnitudes.

### 6.3 Residual

The residual measures how closely the computed root satisfies the original equation.

$$
R = |f(x_{\text{computed}})|
$$

A smaller residual indicates that the computed value satisfies the original equation more closely.

### 6.4 Iteration Count

The iteration count records how many iterations an algorithm performs before reaching the stopping condition or maximum iteration limit.

It helps compare how quickly each method approaches a solution.

### 6.5 Execution Time

Execution time measures how long an algorithm takes to produce an approximation.

The implementation uses repeated runs to calculate the average execution time. This helps reduce the effect of timing variations between individual runs.

### 6.6 Computational Complexity

Computational complexity describes the amount of computational work required by an algorithm.

For this comparison, we consider the work performed per iteration, including function evaluations, derivative evaluations, and the total number of iterations.

The three methods have different convergence characteristics:

- **Bisection Method:** Linear convergence. It reduces the interval containing the root by half in each iteration.
- **Newton-Raphson Method:** Quadratic convergence near a simple root when the initial approximation is sufficiently close and the required conditions are satisfied.
- **Secant Method:** Superlinear convergence, with an approximate convergence order of 1.618 under suitable conditions.

## 7. Project Structure

The project is organized into separate MATLAB files to make the implementation easier to understand and maintain.

```text
Numerical-Algorithms-Comparison/
│
├── main.m
├── bisection.m
├── newtonRaphson.m
├── secant.m
├── README.md
│
└── comparison_results.csv  (generated after running the program)
```

### File Description

| File | Description |
|---|---|
| `main.m` | Main script that runs the experiments, collects results, and generates comparisons. |
| `bisection.m` | Contains the Bisection Method implementation. |
| `newtonRaphson.m` | Contains the Newton-Raphson Method implementation. |
| `secant.m` | Contains the Secant Method implementation. |
| `README.md` | Project documentation. |
| `comparison_results.csv` | Stores the experimental results generated by the program. |

## 8. Requirements

To run this project, you need:

- MATLAB installed on your computer.
- Basic knowledge of running MATLAB scripts.
- The project files downloaded or cloned to your local machine.

## 9. How to Run the Project

1. Download or clone this repository.
2. Extract the project folder if downloaded as a ZIP file.
3. Open MATLAB.
4. Navigate to the project directory.
5. Run the main script:

```matlab
main
```

The script will execute the three numerical methods using the selected test equations and display the comparison results.

## 10. Expected Output

After running the program, the results should provide information about:

- The approximated root produced by each algorithm.
- The number of iterations required.
- The absolute error.
- The residual.
- The average execution time.
- The comparison of convergence behaviour.

The program also generates comparison results that can be used for further analysis and discussion in the research report.

**Note:** Actual experimental results should be obtained by running the MATLAB implementation. No performance values are assumed or presented in advance.

## 11. Contributions

The project involves both the theoretical study of numerical methods and their practical implementation.

My contributions to the project include:

### MATLAB Implementation and Experimental Setup

- Implementing the Bisection, Newton-Raphson, and Secant methods in MATLAB.
- Preparing the test equations and initial approximations.
- Setting up the experiments to compare accuracy, iteration counts, and execution time.
- Working on the collection and presentation of the computational results.

### Final Compilation and Integration

I also volunteered to coordinate the final compilation of the group report. This includes bringing together the contributions from group members, checking consistency across the chapters, organizing references, and handling the final formatting of the document before submission.

## 12. Conclusion

This project provides a practical comparison of three numerical methods for solving nonlinear equations.

Although all three methods aim to approximate roots, they differ in their requirements, convergence behaviour, accuracy, and computational work.

By implementing and testing them in MATLAB, the project aims to provide a better understanding of how numerical algorithms perform under different conditions and why choosing an appropriate method matters when solving mathematical problems.

## 13. Academic Note

This project is being developed as part of the Computational Mathematics coursework at the University of The Gambia.

The implementation and experimental results are intended to support the mathematical analysis and discussion presented in the accompanying research report.</
