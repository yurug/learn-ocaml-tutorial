type color =
  | Green | Red | Yellow | Blue

type number =
  | One | Two | Three | Four 


type position = {x: int ; y: int}
              
type 'a tree =
  | Leaf
  | Node of 'a tree * 'a * 'a tree
