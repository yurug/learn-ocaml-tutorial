let get_x {x ; y} = x

let rec map f l = match l with
  | [] -> []
  | h :: t -> f h :: map f t

let first_elt (x, y) = x
