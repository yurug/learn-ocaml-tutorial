open Test_lib
open Report

(* Exercise 1 *)
let sample_position () = { x=sample_int () ; y=sample_int () }

let exercise_1 =
  Section ([ Text "Function: "; Code "get_x" ],
           test_function_1_against_solution
             [%ty: position -> int ]
             "get_x"
             ~gen:5
             [{ x=0 ; y=0 }]
          )

(* Exercise 2 *)

let sampler_fun () = match Random.int 3 with
  | 0 -> succ
  | 1 -> pred
  | _ -> fun x -> if x < 0 then -1 else 1

(* With method 2, you need to give an alias to a functional type
   in order to use the naming convention for the sampler*)
type f_int_int = int -> int

let sample_f_int_int = sampler_fun

(* With method 1, you don't need to name the functional type*)
let sampler_2 () =
  (sample_f_int_int (), sample_list ~min_size:1 ~max_size:10 sample_int ())


let exercise_2 =
  Section ([ Text "Function: "; Code "map" ],
           (* Grader with method 1 *)
           test_function_2_against_solution
             [%ty:  (int -> int) -> int list -> int list ] "map"
             ~sampler:sampler_2
             ~gen:5
             [(succ, [])] @
           (* Grader with method 2 *)
           test_function_2_against_solution
             [%ty:  f_int_int -> int list -> int list ] "map"
             ~gen:5
             []
          )


(* Exercise 3 *)

type pair_int = int * int
let sample_pair_int () = sample_int (), sample_int ()

let exercise_3 =
  Section ([ Text "Function: "; Code "first_elt" ],
           (* Grader with method 1*)
           test_function_1_against_solution
             [%ty:  pair_int -> int ] "first_elt"
             ~sampler: (fun () -> sample_int (), sample_int ())
             ~gen:5
             []  @
           (* Grader with method 2 *)
           test_function_1_against_solution
             [%ty:  pair_int -> int ] "first_elt"
             ~gen:5
             []
          )



let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2; exercise_3]
