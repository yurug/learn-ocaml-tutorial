# Step 7: Modifying the comparison functions (testers) with the optional arguments [~test], [~test_stdout], [~test_stderr] 

This repository contains the source files for the tutorial [How to
write exercises for the learn-ocaml
platform?](https://github.com/ocaml-sf/learn-ocaml/blob/master/docs/howto-write-exercises.md)

To get the source files for step X do:
```
git checkout step-X
```

For instance, for step 1, do `git checkout step-1`.


## What is to learn in this step ?

* How to change the functions that compare student output, standard
  output and standard error.

* Signature of predefined testers, IO testers and corresponding builders. 

* An specific application: How to grade a student code using a
  predicat instead of a comparison with a solution function.

## List of graded functions 

### tester/test.ml
Used the type 
```ocaml 
type tri = Zero | One | Two 
```

* `convert`: [`convert x`] converts x into the appropriate `tri`. 

* `-`: [`x - y `] computes the substraction of two `tri`.

* `convert_list`: [`convert_list l`] converts a list l of integers into the appropriate `tri list`.

### io_tester/test.ml

* `print_tri`: [`print_tri t`] prints t. 

* `print_tri_list`: [`print_tri_list l`] prints the `tri` list l.

* `print_tri_list_list`: [`print_tri_list l`] prints the list of `tri` list l.

### grading_with_predicate/test.ml

* `rand_int`: [`rand_int ()`] returns a random integer between 0 and 10. 

* `rand_kist`: [`rand_list n`] returns a list of size n of random integer between 0 and 10
