open Test_lib
open Report

(* Trivial example with automatic test generations *)
let exercise_1 = 
  Section ([ Text "Function: "; Code "identity" ], 
           test_function_1_against_solution 
             [%ty: int -> int] (* Type of the tested function *)
             "identity"        (* Identifier of the tested function *)
             ~gen:10           (* number of automatically generated tests *)
             ~sampler:(fun () -> Random.int 42) (* sampler *)
             [0 ; 42]          (* List of tested inputs *)
    )

let exercise_2 = 
  Section ([ Text "Function: "; Code "identity" ], 
           test_function_1 
             [%ty: int -> int] (* Type of the tested function *)
             "identity"        (* Identifier of the tested function *)
             [0, 0, "", "prout" ;
              42, 42, "prout", ""]  (* List of tests *)
    )
  
(* Simple example with standart outputs *)
let exercise_3 = 
  Section ([ Text "Function: "; Code "hello" ], 
           test_function_1_against_solution 
             [%ty: unit -> unit] 
             ~test:test_ignore   (* Function that compares outputs *)
             ~test_stdout:io_test_equals  (* Function that compares standart outputs *)
             "hello"             
             ~gen:0         
             [()]           
          )

let exercise_4 =
  Section ([ Text "Function: "; Code "hello" ],
           test_function_1
             [%ty: unit -> unit] 
             ~test:test_ignore   (* Function that compares outputs *)
             ~test_stdout:io_test_equals  (* Function that compares standart outputs *)
             "hello"             
             [(), (), "Hello world!", ""]
          )

  
let () = 
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2; exercise_3; exercise_4] (* List of exercises *)
