
let rec height t = match t with
  | Leaf -> 0
  | Node (l, _, r) -> 1 + max (height l) (height r)  

let rec monochrome t c = match t with
  | Leaf -> Leaf
  | Node (l, n, d) -> Node (monochrome l c, c, monochrome d c) 
