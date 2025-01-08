(* {{{ COPYING *(

     This file is part of Merlin, an helper for ocaml editors

     Copyright (C) 2013 - 2024  Xavier Van de Woestyne <xaviervdw(_)gmail.com>
                                Arthur Wendling <arthur(_)tarides.com>


     Permission is hereby granted, free of charge, to any person obtaining a
     copy of this software and associated documentation files (the "Software"),
     to deal in the Software without restriction, including without limitation the
     rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
     sell copies of the Software, and to permit persons to whom the Software is
     furnished to do so, subject to the following conditions:

     The above copyright notice and this permission notice shall be included in
     all copies or substantial portions of the Software.

     The Software is provided "as is", without warranty of any kind, express or
     implied, including but not limited to the warranties of merchantability,
     fitness for a particular purpose and noninfringement. In no event shall
     the authors or copyright holders be liable for any claim, damages or other
     liability, whether in an action of contract, tort or otherwise, arising
     from, out of or in connection with the software or the use or other dealings
     in the Software.

   )* }}} *)

(** A parsed type expression representation, where type variables are expressed
    as strings and must be normalized in a {!type:Type_expr.t}. *)

type t =
  | Arrow of t * t
  | Tycon of string * t list
  | Tuple of t list
  | Tyvar of string
  | Wildcard
  | Unhandled

(** Create a tuple using a rather naive heuristic:
    - If the list is empty, it produces a type [unit]
    - If the list contains only one element, that element is returned
    - Otherwise, a tuple is constructed. *)
val tuple : t list -> t