open Test_lib
open Report

(* Example with test_function_1_against_solution *)
let exercise_1 = 
  Section ([ Text "Function: "; Code "hello" ], 
           test_function_1_against_solution 
             [%ty: unit -> unit]
             ~test:test_ignore
             ~test_stdout:io_test_equals
             "hello"        
             ~gen:0         
             [()]           
          )

(* Example with test_function_1_against *)
let exercise_2 = 
  Section ([ Text "Function: "; Code "hello" ], 
           test_function_1_against
             [%ty: unit -> unit] 
             ~test:test_ignore
             ~test_stdout:io_test_equals
             "hello"        
             (fun () -> print_endline "Hello world!")
             ~gen:0 
             [()]     
    )
  
(* Example with test_function_1 *)
let exercise_3 = 
  Section ([ Text "Function: "; Code "hello" ], 
           test_function_1
             [%ty: unit -> unit]
             ~test:test_ignore
             ~test_stdout:io_test_lines
             "hello" 
             [((), (), "Hello world!", "")]
    )
  
let () = 
  set_result @@
  ast_sanity_check code_ast @@ fun () ->
  [ exercise_1; exercise_2; exercise_3 ] (* List of exercises *)
