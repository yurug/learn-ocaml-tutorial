open Test_lib
open Report


(*Method 2: Defining the samplers*)
let sample_col () = match Random.int 2 with
  | 0 -> B
  | _ -> R
      
(*Random generator for binary trees*)
let sample_tree (sample: unit -> 'a) : unit -> 'a tree =
  let rec builder h = match h with
    | 0 -> Leaf
    | n -> match Random.int 3 with
      | 0 -> Leaf
      | _ -> Node (builder (h-1), sample (), builder (h-1))    
  in
  let h = Random.int 5 + 2 in
  fun () -> builder h

let exercise_1 =
  Section ([ Text "Function: "; Code "height" ],
           test_function_1_against_solution
             [%ty: col tree -> int] "height"
             ~gen:5
             [] @
           test_function_1_against_solution
             [%ty: int tree -> int] "height"
             ~gen:5
             []
          )

let exercise_2 =
  Section ([ Text "Function: "; Code "monochrome" ],
           test_function_2_against_solution
             [%ty: col tree -> col -> col tree] "monochrome"
             ~gen:5
             []
          )


(*Method 1: using the ~sampler optional argument*)
let sample_col_tree () = 
  let rec builder h = match h with
    | 0 -> Leaf
    | n -> match Random.int 3 with
      | 0 -> Leaf
      | _ -> Node (builder (h-1), sample_col (), builder (h-1))    
  in
  let h = Random.int 5 + 2 in
  builder h

let exercise_3 =
  Section ([ Text "Function: "; Code "monochrome" ],
           test_function_2_against_solution
             [%ty: col tree -> col -> col tree] "monochrome"
             ~sampler:(fun () -> sample_col_tree (), sample_col ())
             ~gen:5
             []
          )
    
let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1 ; exercise_2 ; exercise_3 ]
