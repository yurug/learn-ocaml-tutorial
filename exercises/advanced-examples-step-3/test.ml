open Test_lib
open Report

(* An example with list, using predefined sampler *)
let exercise_1 =
  Section ([ Text "Function: "; Code "push" ],
           test_function_2_against_solution
             [%ty: int -> int list -> int list] "push"
             ~gen:5
             []
    )

(* An example with tuple *)
let exercise_2 =
  Section ([ Text "Function: "; Code "first" ],
           test_function_1_against_solution
             [%ty: (int * int) -> int] "first"
             ~gen:5
             ~sampler:(fun () -> (Random.int 10, Random.int 10))
             []
    )

(* An basic example with option type *)
let exercise_3 =
  Section ([ Text "Function: "; Code "opt" ],
           test_function_1_against_solution
             [%ty: int option -> int] "opt"
             ~gen:5
             []
    )
  
(* An more advanced example with option type  *)
let sampler_4 () =
  let sampler_tuple () = (sample_int (), sample_int ()) in
  (sample_option sampler_tuple) ()

let exercise_4 =
  Section ([ Text "Function: "; Code "opt_add" ],
           test_function_1_against_solution
             [%ty: (int * int) option -> int] "opt_add"
             ~gen:5
             ~sampler:sampler_4
             []
    )

(* An example with functional type *)
let sampler_5 () =
  let sampler_f () = match Random.int 3 with
    | 0 -> succ
    | 1 -> pred
    | _ -> fun _ -> 0 in
  sampler_f (), sample_int ()


let exercise_5 =
  Section ([ Text "Function: "; Code "apply" ],
           test_function_2_against_solution
             [%ty: (int -> int) -> int -> int] "apply"
             ~gen:5
             ~sampler:sampler_5
             []
    )
  
(* An example with array *)
let sampler_6 =
  sample_array ~min_size:1 ~max_size:10 sample_int
  
let exercise_6 =
  Section ([ Text "Function: "; Code "array_to_list" ],
           test_function_1_against_solution
             [%ty: int array -> int list] "array_to_list"
             ~gen:5
             ~sampler:sampler_6
             []
    )


  
  
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [  exercise_1; exercise_2; exercise_3; exercise_4 ; exercise_5; exercise_6]
