# Step 4: Grading with generators for user-defined types

This repository contains the source files for the tutorial

[How to write exercises for the learn-ocaml platform?](https://github.com/ocaml-sf/learn-ocaml/blob/master/docs/howto-write-exercises.md)

To get the source files for step X do:
```
git checkout step-X
```

For instance, for step 1, do `git checkout step-1`.

## What is to learn in this step ?

* How to define a sampler for non-parametric user-defined type

* How to define a sampler for parametric user-defined type

## List of graded functions

### sampler-user-defined-types/test.ml

#### Defined type

``` ocaml
type color = Green | Yellow | Red | Blue
```
#### Function

* `color_to_string`: [`color_to_string col`] takes an input of type `col` and returns a corresponding `string`.

### sampler-used-defined-parametric-types/test.ml

#### Defined types
```ocaml
type 'a tree =
  | Leaf
  | Node of 'a tree * 'a * 'a tree

type col = R | B
```
#### Functions

* `height`: [`height t`] returns the height of the tree `t`

* `monochrome`: [`monochrome t c`] returns a tree with the same structure as `t` where all nodes are colored with the color `c`

### advanced-examples-step-4/test.ml

* `get_x`: [`get_x {x; y}`] returns `x`.

* `map`: similar than `List.map`

* `first_elt`: [`first_elt (x, y)`] returns `x`.
