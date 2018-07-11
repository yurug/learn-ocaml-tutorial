open Test_lib
open Report

let exercise_1 =
    Section ([ Text "Function:" ; Code "op" ],
             test_function_2_against_solution
          (* test function for binary functions *)
               [%ty: int -> int -> int]
               "op"
               ~gen:0 [ (1,2) ; (0,1) ]
      )

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1 ]

