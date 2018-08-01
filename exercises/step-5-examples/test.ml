open Test_lib
open Report

(* Trivial example with automatic test generations *)
let exercise_1 = 
  Section ([ Text "Function: "; Code "identity" ], 
           test_function_1_against_solution 
             [%ty: int -> int] (* Type of the tested function *)
             "identity"        (* identifier of the tested function *)
             ~gen:10           (* number of automatically generated tests *)
             ~sampler:(fun () -> Random.int 42) (* sampler *)
             [0 ; 42]          (* List of tested inputs *)
    )

(* Simple example with standart outputs *)
let exercise_2 = 
  Section ([ Text "Function: "; Code "hello" ], 
           test_function_1_against_solution 
             [%ty: unit -> unit] (* Type of the tested function *)
             ~test:test_ignore   (* Function that compares outputs *)
             ~test_stdout:io_test_equals  (* Function that compares standart outputs *)
             "hello"             (* identifier of the tested function *)
             ~gen:0         
             [()]           
          )
  
  
let () = 
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2] (* List of exercises *)
