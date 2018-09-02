let print_tri = function
  | Zero -> print_string "Zero"
  | One -> print_string "One"
  | Two -> print_string "Two"

let rec print_tri_list = function
  | [] -> ()
  | x :: [] -> print_tri x
  | x :: r -> print_tri x ; print_string ","; print_tri_list r

let rec print_tri_list_list = function
  | [] -> ()
  | x :: [] -> print_tri_list x
  | x :: r -> print_tri_list x ; print_endline ""; print_tri_list_list r

