jQuery ->
  $("#q").autocomplete(
    source: "/admin/users/autocomplete",
    minLength: 2,
  )
