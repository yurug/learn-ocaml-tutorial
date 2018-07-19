open Test_lib
open Report

(* Example with test_function_1_against_solution *)
let exercise_1 = 
  Section ([ Text "Function: "; Code "identity" ], 
           test_function_1_against_solution 
             [%ty: int -> int] (* Type of the tested function *)
             "identity"        (* identifier of the tested function *)
             ~gen:10           (* number of automatically generated tests *)
             []                (* List of tested inputs *)
          )

(* Example with test_function_1_against *)
let exercise_2 = 
  Section ([ Text "Function: "; Code "identity" ], 
           test_function_1_against
             [%ty: int -> int] (* Type of the tested function *)
             "identity"        (* identifier of the tested function *)
             (fun x -> x)      (* solution function*)
             ~gen:10           (* number of automatically generated tests *)
             []                (* List of tested inputs *)
    )
  
(* Example with test_function_1 *)
let exercise_3 = 
  Section ([ Text "Function: "; Code "identity" ], 
           test_function_1
             [%ty: int -> int]  (* Type of the tested function *)
             "identity"         (* identifier of the tested function *)
             [(0, 0, "", "") ;  (* test 1 *)
              (42, 42, "", "")] (* test 2*)
    )
  
let () = 
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2; exercise_3] (* List of exercises *)
