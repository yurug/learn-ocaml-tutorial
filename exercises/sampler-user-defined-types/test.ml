open Test_lib
open Report


(*Sampler for a non-parametric user-defined type*)
let sample_color () : color = match Random.int 4 with
  | 0 -> Red
  | 1 -> Green
  | 2 -> Yellow
  | _ -> Blue


let exercise_1 =
  Section ([ Text "Function: "; Code "color_to_string" ],
           test_function_1_against_solution
             [%ty: color -> string] "color_to_string"
             ~gen:5
             []
          )

    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1]
