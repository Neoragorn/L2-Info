let est_trie t =
  let n = Array.length t
  and i = ref 0
  in
  while !i < n-1 && t.(!i) <= t.(!i+1) do
    i := !i + 1
  done;
  !i = n - 1

let tableau_decroissant n =
  let f i =
    n - i
  in
  Array.init n f

let tableau_croissant n =
  let f i =
    i
  in
  Array.init n f

let tableau_aleatoire n =
  let f i =
    (Random.int 100000)
  in
  Array.init n f

let _ =
  Random.self_init ()
