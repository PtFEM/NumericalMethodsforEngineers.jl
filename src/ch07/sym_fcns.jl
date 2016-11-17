@sym begin
  f(xi_, yi_) := Module([res],
    (
      res = xi * yi,
      SetJ(r, ToString(res))
    )
  )
end
