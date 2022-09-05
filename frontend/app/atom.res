type user = {
  id: string,
  nickname: string,
  profile: string,
}

let users_atom: Jotai.Atom.t<array<user>, _, _> = Jotai.Atom.make([])
