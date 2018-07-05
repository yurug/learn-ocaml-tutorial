open Test_lib
open Report

(* A basic way to grade a function with automatically generated tests:
   using the default sampler (works only for non-functional build-it
   types. *)
let exercise_1 =
  Section ([ Text "Function: "; Code "identity" ],
           test_function_1_against_solution
             [%ty: int -> int] "identity"
             ~gen:5 [0]
          )

(* With a user-defined sampler : 
   Method 1: Using the optional argument ~sampler *)
let exercise_2 =
  Section ([ Text "Function: "; Code "pi1" ],
           test_function_2_against_solution
             [%ty: int -> int -> int] "pi1"
             ~sampler:(fun () -> Random.int 31 + 12, Random.int 31 + 12)
             ~gen:5
             []
          )


(* With a user-defined sampler :
   Method 2: redefine sampler with respect to naming rule
   val sample_<type>: unit -> <type>  *)
let sample_int () = Random.int 10 + 42
let exercise_3 =
  Section ([ Text "Function: "; Code "pi1" ],
           test_function_2_against_solution
             [%ty: int -> int -> int] "pi1"
             ~gen:5
             []
          )


let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [
    exercise_1; exercise_2; exercise_3;
  ]
