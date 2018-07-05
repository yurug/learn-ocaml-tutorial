# Step 3: Grading with generators for Ocaml built-in types

This repository contains the source files for the tutorial

[How to write exercises for the learn-ocaml platform?](https://github.com/ocaml-sf/learn-ocaml/blob/master/docs/howto-write-exercises.md)

To go to another step and get the corresponding source files do (for step X):
```
git checkout step-X
```

## What is to learn in this step ?


* how to use a predefined sampler

* list of predefined samplers

* how to define its own sampler using the optional argument `~sampler`

* how to define its own sampler using using a naming convention 

## List of graded function 

### sampler-built-in-types/test.ml

* `identity`

* `pi1`: [`pi1 x y`] returns `x`

### advanced_examples/test.ml

* `push`: [`push elt l`] returns `elt :: l`.

* `first`: [`first (x, y)`] returns `x`

* `opt`: [`opt x`] return `x` if `x = None` and `a` if `x = Some a`

* `opt_add`: [`opt_add x`] returns `0` if `x = None` and `a+b` if `x = Some (a, b)` 

* `apply`

* `array_to_list`

