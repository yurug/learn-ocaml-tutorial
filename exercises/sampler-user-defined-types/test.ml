open Test_lib
open Report


(* Sampler for a non-parametric user-defined type
   Method 1: Using the ~sampler optional argument *)
let exercise_1 =
  Section ([ Text "Function: "; Code "color_to_string" ],
           test_function_1_against_solution
             [%ty: color -> string] "color_to_string"
             ~sampler: (fun () ->  match Random.int 4 with
                 | 0 -> Red | 1 -> Green | 2 -> Yellow | _ -> Blue)
             ~gen:5
             []
          )

(* Sampler for a non-parametric user-defined type
   Method 2: Define a sampler using a naming convention *)
let sample_color () : color = match Random.int 4 with
  | 0 -> Red
  | 1 -> Green
  | 2 -> Yellow
  | _ -> Blue

let exercise_2 =
  Section ([ Text "Function: "; Code "color_to_string" ],
           test_function_1_against_solution
             [%ty: color -> string] "color_to_string"
             ~gen:5
             []
          )


let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2]

let a = [1,'x';2,'y']
