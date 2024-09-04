local ls = require("luasnip")

-- custom snippets
ls.add_snippets("all", {
  -- available in any filetype
  ls.parser.parse_snippet("expand", "-- this is what was expanded"),
})

-- custom snippets
ls.add_snippets("lua", {
  -- available in any filetype
  ls.parser.parse_snippet("lf", "local $1 = function($2)\n  $0\nend"),
})
