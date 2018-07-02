open Test_lib
open Report


let exercise_1 = 
    Section ([ Text "Function: "; Code "identity" ],
             test_function_1_against_solution
               [%ty: int -> int] (* [identity] tested with integer *)
               "identity"
               ~gen:0 [1 ; 2] @
             test_function_1_against_solution
               [%ty: char -> char] (* [identity] tested with char *)
               "identity"
               ~gen:0 ['c' ; 'a'] @
             test_function_1_against_solution
               [%ty: float -> float] (* [identity] tested with float *)
               "identity"
               ~gen:0 [1.1 ; 2.4]
            )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1 ]
