open Test_lib
open Report


let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [
    Section ([ Text "The identity of 0 is 0." ],
             test_function_1_against_solution
               [%ty: int -> int] "identity"
               ~gen:0 [1 ; 2] @
             test_function_1_against_solution
               [%ty: char -> char] "identity"
               ~gen:0 ['c' ; 'a'] @
             test_function_1_against_solution
               [%ty: float -> float] "identity"
               ~gen:0 [1.1 ; 2.4]
            );
  ]
