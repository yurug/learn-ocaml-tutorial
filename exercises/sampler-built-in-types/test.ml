open Test_lib
open Report

(*A first way to grade this function with randomly generated tests 
  is by using the default sampler.*)
let exercise_1 =
  Section ([ Text "Function: "; Code "identity" ],
           test_function_1_against_solution
             [%ty: int -> int] "identity"
             ~sampler:(fun () -> Random.int 32)
             ~gen:5 [0]
          )


(*Using the optional argument ~sampler*)
let exercise_2 =
  Section ([ Text "Function: "; Code "pi1" ],
           test_function_2_against_solution
             [%ty: int -> int -> int] "pi1"
             ~sampler:(fun () -> Random.int 31 + 12, Random.int 31 + 12)
             ~gen:5
             []
          )


(*Redefine sampler*)
let sample_int () = Random.int 10 + 42
let exercise_3 =
  Section ([ Text "Function: "; Code "pi1" ],
           test_function_2_against_solution
             [%ty: int -> int -> int] "pi1"
             ~gen:5
             []
          )

(*Example for a parametric type composed of built-in types*)
let exercice_4 =
  Section ([ Text "Function: "; Code "push" ],
           test_function_2_against_solution
             [%ty: int -> int list -> int list] "push"
             ~gen:5
             []
          )


let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [
    exercise_1; exercise_2; exercise_3; exercice_4
  ]
