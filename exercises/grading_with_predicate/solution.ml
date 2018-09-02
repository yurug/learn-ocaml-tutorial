let rand_int () = Random.int 10

let rec rand_list n = match n with
    | 0 -> []
    | _ -> rand_int () :: rand_list (n-1)
