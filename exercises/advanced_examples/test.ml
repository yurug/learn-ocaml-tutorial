open Test_lib
open Report


let sample_number () =
  match Random.int 4 with
  | 0 -> One
  | 1 -> Two
  | 2 -> Three
  | _ -> Four

let sample_color () =
  match Random.int 4 with
  | 0 -> Green
  | 1 -> Red
  | 2 -> Yellow
  | _ -> Blue


let exercise_1 = 
  Section ([ Text "Function: "; Code "pair" ],
           test_function_2_against_solution
             [%ty: color -> number -> color * number] "pair"
             ~sampler:(fun () -> sample_color (), sample_number ())
             ~gen:5
             []
          )

let exercise_2 =
  Section ([ Text "Function: "; Code "add" ],
           test_function_2_against_solution
             [%ty: color * number -> (color * number) list -> (color * number) list] "add"
             ~sampler:(fun () ->
                 (*sample_list is predefined in test_lib.ml*)
                 let list =  sample_list ~min_size:0 ~max_size:10
                                (fun () -> sample_color (), sample_number ()) () in
                 ((sample_color (), sample_number ()), list ) 
               )
             ~gen:5
             []
          )
    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2 ]
