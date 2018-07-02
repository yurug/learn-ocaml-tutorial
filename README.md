#  Step 2: Basic grading by comparison with your solution

This repository contains the source files for the tutorial

[How to write exercises for the learn-ocaml platform?](https://github.com/ocaml-sf/learn-ocaml/blob/master/docs/howto-write-exercises.md)

To go to another step and get the corresponding source files do (for step X):
```
git checkout step-X
```

## What is to learn in this step ?

How to:

* grade a arity-one function by comparison to a given solution

* grade multiple-arguments functions

* grade a polymorphic function with different input types

## List of graded function 

### grade-function/test.ml

* `identity`: [`identity x`] returns x. Tested with integer inputs.

### grade-function-polymorphic/test.ml

* `identity`: [`identity x`] returns x. Tested with integer, char and float inputs.

### grade-function-multiple-args/test.ml

* `op`: [`op x y`] returns the result of the operation `x * y + y`.


