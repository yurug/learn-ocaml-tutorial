open Test_lib
open Report

let sample_tri () = match Random.int 3 with
  | 0 -> Zero
  | 1 -> One
  | _ -> Two

let exercise_1 =
  grade_function_1_against_solution
    [%ty: int -> tri] "convert"
    ~gen:0
    ~test:test
    [-1; 0; 1; 2; 3]
    
let exercise_2 =
  grade_function_2_against_solution
    [%ty: tri -> tri -> tri] "-"
    ~gen:9
    ~test:(test_eq_exn
             (fun exn1 exn2 -> match exn1, exn2 with Failure _, Failure _ -> true | _, _ -> false))
    [One, Two]

let exercise_3 =
  grade_function_1_against_solution
    [%ty: int list -> tri list] "convert_list"
    ~gen:5
    ~sampler:(sample_list (fun () -> Random.int 3))
    ~test:(test_canon_ok (List.sort compare))
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2; exercise_3]
