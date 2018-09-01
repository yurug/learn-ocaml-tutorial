open Test_lib
open Report

let sample_tri ()= match Random.int 3 with
  | 0 -> Zero
  | 1 -> One
  | _ -> Two

let exercise_1 =
  grade_function_1_against_solution
    [%ty: tri -> unit]
    "print_tri"
    ~gen:0
    ~test:test_ignore
    ~test_stdout:(io_test_equals  ~trim:[' '])
    [Zero; One; Two]

let exercise_2 =
  grade_function_1_against_solution
    [%ty: tri list-> unit]
    "print_tri_list"
    ~gen:3
    ~test:test_ignore
    ~sampler:(sample_list sample_tri)
    ~test_stdout:(io_test_items ~split:[','] ~trim:[' '])
    []

let exercise_3 =
  grade_function_1_against_solution
    [%ty: tri list list-> unit]
    "print_tri_list_list"
    ~gen:4
    ~test:test_ignore
    ~sampler:(sample_list (sample_list sample_tri))
    ~test_stdout:(io_test_lines ~test_line:(io_test_items ~split:[','] ~trim:[' ']) ~trim:[' '])
    []

let () =
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2; exercise_3 ]
