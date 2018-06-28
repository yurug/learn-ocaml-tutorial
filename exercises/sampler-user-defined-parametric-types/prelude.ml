type 'a tree =
  | Leaf
  | Node of 'a tree * 'a * 'a tree

type col = R | B
