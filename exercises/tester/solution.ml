let convert x = match x with
  | 0 -> Zero
  | 1 -> One
  | 2 -> Two
  | _ -> raise (OutOfRange x)

let (-) x y =
  match x, y with
  | Zero, Zero | One, One | Two, Two-> Zero
  | _ , Zero -> x
  | Two, One -> One
  | _ ->  failwith "Negative result."

let convert_list =
  List.map convert
