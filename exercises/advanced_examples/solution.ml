let push elt l = elt :: l

let first (x, y) = x

let opt = function
  | None -> 0
  | Some x -> x

let opt_add = function
  | None -> 0
  | Some (x, y) -> x + y

let apply f x = f x

let rec array_to_list a = Array.to_list a
